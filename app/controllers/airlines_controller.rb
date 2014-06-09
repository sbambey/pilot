class AirlinesController < ApplicationController
  def new
  	@airline = Airline.new
  end

  def create
  	@airline = Airline.new(airline_params)
  	if @airline.save
  		flash[:success] = "Added airline successfully!"
  		redirect_to @airline
  	else
  		render 'new'
  	end
  end

  private

  	def airline_params
  		params.require(:airport).permit(:name, :logo)
  	end
end
