class HomeController < ApplicationController	
	before_filter :require_user, :only => [:submission_landing, :edit_submission, :previous_submissions, :current_submissions]
	
	def index
		#render :text => ENV['AUTHORIZE_LOGIN_ID'] and return
		session[:submission_id] = nil
	end

	def submission_landing	
		@current_submissions = current_user.editing_submissions
		@complete_submissions = current_user.completed_submissions
	end

	def edit_submission
		submission_id = params[:id]
		redirect_to root_url and return unless submission_id
		@submission = current_user.submissions.find(submission_id)
		redirect_to root_url and return if @submission.blank? || @submission.status == 'complete'

		session[:submission_type] = @submission.type
		session[:submission_id] = @submission.id

		if @submission.categories.count == 0
			redirect_to '/submission/step/categories'
		elsif @submission.categories.count > 0
			redirect_to '/submission/step/information'
		else
			redirect_to submission_step_index_path.to_s+'?type='+@submission.type
		end
			
	end
	
	def previous_submissions
		#@complete_submissions = current_user.completed_submissions
		@complete_submissions = []
		current_user.orders.each do |order|
			order.submissions.each do |submission|
				@complete_submissions << submission
			end
		end
		
	end
	def current_submissions
		@current_submissions = current_user.editing_submissions
	end

	def search_submissions
    @submissions = Submission.where(:title=>params[:search])
	end
	def resume_later
		#render :text=>params.inspect and return
		@submission ||= current_submission
		if params[:type]=="ProductSpec"			
			product = @submission.product_spec
			product.attributes=params[:product_spec]
			product.save
		elsif params[:type]=="ProjectSpec"
			project = @submission.project_spec
			project.attributes=params[:project_spec]
			project.save
		elsif params[:type]=="Submission"
			@submission.attributes = params[:submission]
			@submission.save	
		end
		session[:submission_type] = session[:submission_id] = nil
		redirect_to :home_submission_landing and return
	end

	def vote
	end

	def event
	end

	def faq
	end

	def interior_design
	end
	
	def contact_us
	end
	def add_new_img
		if params[:type]=="product_img"
			product = current_submission.product_spec
			@pictures = product.pictures.build
		end
	end
end
