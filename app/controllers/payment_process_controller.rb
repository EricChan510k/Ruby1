class PaymentProcessController < ApplicationController
	before_filter :require_user

	include Wicked::Wizard
	steps :checkout, :purchase

	def show
    @order = current_order unless current_order.nil?
    @submissions = current_user.submissions.whole_submissions.all.reject{|s| !s.valid? }

		case step
		when :checkout
			@order = current_user.orders.build if current_order.nil?
			@order.save
			@order.order_submissions.build
			session[:order_id] = @order.id
		when :purchase
			@order ||= current_order
			@order.build_payment if @order.payment.nil?
		end
		render_wizard
	end

	def update
		@order ||= current_order
		case step
		when :checkout
      @order.submissions = [] # Reset
			@order.attributes = params[:order]
      @order.save && @order.reload
      if @order.submissions.blank?
        flash[:notice] = t('controllers.payment_process.show.select.missing')
        redirect_to request.path and return
      end
		when :purchase
#			render :text => params.inspect and return
      raise BestOfYearAwards::Unauthorized if @order.blank? || @order.completed?
			@order.attributes = params[:order]
			amount = @order.calculate_price
			amount_in_cents = amount.to_f*100
			credit_card = ActiveMerchant::Billing::CreditCard.new(
				:number								=>params[:card_number],
				:verification_value		=>params[:cvv_number],
				:month								=>params[:exp_month],
				:year									=>params[:exp_year],
				:first_name						=>params[:order][:shipping_first_name],
				:last_name						=>params[:order][:shipping_last_name]
			)

			if credit_card.valid?
				purchase_options= {
          :ip => request.remote_ip,
          :billing_address => {
            # :company  => current_user.company_name,
            :first_name => params[:order][:shipping_first_name],
            :last_name => params[:order][:shipping_last_name],
            :address1 => params[:order][:shipping_address],
            :city     => params[:order][:shipping_city],
            :state    => params[:order][:shipping_state],
            :country  => params[:order][:shipping_country],
            :zip      => params[:order][:shipping_zip_code]
          }
        }
    
				#response = GATEWAY.authorize(amount_in_cents, credit_card)
        # puts amount_in_cents, credit_card.inspect, purchase_options
				response = GATEWAY.purchase(amount_in_cents, credit_card, purchase_options)
        # puts response.inspect
				if response.success?
					@order.token_key = response.params["transaction_id"]
					@order.payment_option = 'card'
					@order.balance_amount = @order.calculate_price.fractional
					if @order.save && @order.complete(params[:cvv_number])
            session[:order_id] = nil
						flash[:notice] = t('controllers.payment_process.update.success')
            redirect_to root_url and return
					end
				else
          @order.errors.add(:base, t('controllers.payment_process.update.card_error', :msg => (response.message || 'Unknown error')))
          # raise StandardError, response.message
				end

			else
				flash.now[:notice] = credit_card.errors.full_messages.join('. ')
			end

			respond_to do |format|
	      format.html { render action: "purchase" }
	      format.json { render json: @order.errors, status: :unprocessable_entity }
	    end
	    return

		end	
		
		render_wizard @order
	end
	private
		def redirect_to_finish_wizard
			redirect_to root_url, notice: t('controllers.payment_process.complete.notice')
		end
end
