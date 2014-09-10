class AirlinesController < ApplicationController

  #skip_before_filter :verify_authenticity_token, :only => [:new, :create]

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

  def edit
    @airline = Airline.friendly.find(params[:id])
  end
  
  def update
    @airline = Airline.friendly.find(params[:id])
    params = airline_params
    if @airline.update_attributes(params)
      flash[:success] = "Airline updated!"
      redirect_to @airline
    else
      render 'edit'
    end
  end

  def index
    @airlines = Airline.all
  end

  def show
    @airline = Airline.friendly.find(params[:id])
    if request.path != airline_path(@airline)
      redirect_to @airline, status: :moved_permanently
    end
  end

  private

  	def airline_params
  		params.require(:airline).permit(:name, :logo)
  	end
end
