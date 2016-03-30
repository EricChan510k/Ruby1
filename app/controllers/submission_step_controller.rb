class SubmissionStepController < ApplicationController
	before_filter :require_user

	include Wicked::Wizard
	steps :agreement, :categories, :information, :confirm

	def show		
		case step		
		when :agreement
			redirect_to :home_submission_landing and return if params[:type].nil? or !Submission::TYPE.include? params[:type]
			session[:submission_type] = params[:type]
			
			if session[:submission_id].nil?
				@submission = current_user.submissions.build :title=>"Input #{session[:submission_type]}", :status => 'editing', :submission_type =>params[:type]
				@submission.save
				session[:submission_id] = @submission.id
#			elsif current_submission && session[:submission_type] != current_submission.type
#				@submission = current_user.submissions.build :title=>"Please input name"
#				@submission.save
#				session[:submission_id] = @submission.id			
			else
				@submission = current_submission
				if @submission.blank?
					@submission = current_user.submissions.build :title=>"Input #{session[:submission_type]} submission name", :status => 'editing', :submission_type =>params[:type]
					@submission.save
					session[:submission_id] = @submission.id
				end
			end
		when :categories
			if session[:submission_type] == "project"
				@categories = Category::project_categories
			elsif session[:submission_type] == "product"
				@categories = Category::product_categories
			end

			redirect_to :home_submission_landing and return unless current_submission
			@submission ||= current_submission
			@submission.submission_categories.build if @submission.submission_categories.nil?
		when :information
			redirect_to :home_submission_landing and return unless current_submission 
			@submission ||= current_submission

			if session[:submission_type] == Submission::TYPE[1]
				product = @submission.product_spec.nil? ? @submission.build_product_spec : @submission.product_spec
				product.save
				product.build_contact if product.contact.nil?
				product.pictures.build
				@submission = product
			elsif session[:submission_type] == Submission::TYPE[0]
				project = @submission.project_spec.nil? ? @submission.build_project_spec : @submission.project_spec
				project.save
				project.build_contact if project.contact.nil?
				project.build_company if project.company.nil?
				project.pictures.build
				project.resources.build
				@submission = project
			end

		when :confirm	
			redirect_to root_url and return unless current_submission
			@submission = current_submission
      session[:submission_type] = session[:submission_id] = nil
      # session[:submission_id] = nil
		end
		render_wizard
	end

	def update
    redirect = false

		#render :text => params.inspect and return
		@submission = current_submission
		case step		
		when :categories
			asdfasdf
      @submission.assign_attributes(params[:submission])
      @submission.status = 'draft'
      redirect = save_or_save_as_draft(@submission)

		when :information			
			if session[:submission_type] == Submission::TYPE[1]
				@submission = current_submission
				@submission.status = "whole"
				product = @submission.product_spec				
				product.attributes = params[:product_spec]
        redirect = save_or_save_as_draft(@submission)
				@submission = product
			elsif session[:submission_type] == Submission::TYPE[0]
				@submission = current_submission
				@submission.status = "whole"
				project = @submission.project_spec
				project.attributes = params[:project_spec]
        redirect = save_or_save_as_draft(@submission)
				@submission = project
			end
		end			

    unless redirect.blank?
      redirect_to redirect
    else
      render_wizard @submission
    end
	end

private

	def redirect_to_finish_wizard
		redirect_to root_url, notice: t('controllers.submission_step.complete.notice')
	end

  def save_or_save_as_draft(s)
    if params[:save_as_draft]
      if s.save(:validate => false)
        flash[:notice] = t('controllers.submission_step.draft.notice')
        session[:submission_type] = session[:submission_id] = nil
        return :home_submission_landing
      end
    else
      s.save
    end

    false
  end

end
