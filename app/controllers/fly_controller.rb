class FlyController < ApplicationController

  #before_action :admin_user

  def new
  	@airline = Airline.friendly.find(params[:airline_id])
  	@fly = @airline.flies.build
    @model_name = controller_name.classify[0,1].downcase + controller_name.classify[1..-1]
    #@fly.headings.build
  end

  def show
    @airline = Airline.friendly.find(params[:airline_id])
  	@fly = @airline.flies.friendly.find(params[:id])
    
  	if request.path != airline_fly_path(@airline, @fly)
  		redirect_to airline_fly_path(@airline, @fly), status: :moved_permanently
  	end
  end

  def create
    @airline = Airline.friendly.find(params[:airline_id])
    @fly = @airline.flies.create(fly_params)
  	if @fly.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to airline_fly_path(@airline, @fly)
  	else
  		render 'new'
  	end
  end

  def edit
    @airline = Airline.friendly.find(params[:airline_id])
    @fly = @airline.flies.friendly.find(params[:id])
    @model_name = controller_name.classify[0,1].downcase + controller_name.classify[1..-1]
  end

  def update
    @airline = Airline.friendly.find(params[:airline_id])
    @fly = @airline.flies.friendly.find(params[:id])
    params = fly_params
    if @fly.update_attributes(params)
      flash[:success] = "Opportunity updated!"
      redirect_to airline_fly_path(@airline, @fly)
    else
      render 'edit'
    end
  end

  def index
    @flies = Airline.friendly.find(params[:airline_id]).flies
  end

  private

  	def fly_params
  		params.require(:fly).permit(:name, :program_type, :duration, :post_graduation, {:website => []}, :hiring_status, :rating).tap do |whitelisted|
        whitelisted[:headings_attributes] = params[:fly][:headings_attributes]
      end
  	end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end

