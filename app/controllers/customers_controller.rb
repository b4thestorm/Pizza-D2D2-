class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @spots = Spot.all
    @lat = session[:latitude]
    @lon = session[:longitude]
  end


  def new

    @customer = Customer.new
    @customer_loc = request.location
    @latitude = @customer_loc.data['latitude']
    session[:latitude] = @latitude
    @longitude = @customer_loc.data['longitude']
    session[:longitude] = @longitude
  end

  def edit
  end

  
  def create
    @customer = Customer.new(customer_params)

      if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.' 
      else
      render :new 
      end
  end



  def update
      if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.' 
      else
      render :edit 
      end
  end


  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.' 

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:address,:latitude,:longitude)
    end
end
