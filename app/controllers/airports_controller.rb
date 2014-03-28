class AirportsController < ApplicationController
  def new
  	@airport = Airport.new
  end

  def show
  	@airport = Airport.find(params[:id])
  end

  def create
  	@airport = Airport.new(airport_params)
  	if @airport.save
  		flash[:success] = "Added airport successfully!"
  		redirect_to @airport
  	else
  		render 'new'
  	end
  end

  private

  	def airport_params
  		params.require(:airport).permit(:name, :city, :state, :website)
  	end
end
