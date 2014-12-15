class CustomerController < ApplicationController
	def index

	end

	def new
		@customer = Customer.new
	end

	def create
		@Customer = Customer.new(cust_params)
		if @customer.save
			flash[:alert] = "Success" 
			redirect_to :show
		else
			render :new
		end
	end

	private
	def cust_params
		params.require(:customer).permit(:address,:latitude,:longitude)
	end
end
