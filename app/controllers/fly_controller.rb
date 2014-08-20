class FlyController < ApplicationController

  #before_action :admin_user

  def new
  	@airline = Airline.where(name: params[:airline_id]).first
  	@fly = Fly.new
    @model_name = controller_name.classify[0,1].downcase + controller_name.classify[1..-1]
    #@fly.headings.build
  end

  def show
  	@fly = Fly.friendly.find(params[:id])
    @airline = Airline.friendly.find(@fly.airline_id)
  	if request.path != airline_fly_path(@airline, @fly)
  		redirect_to airline_fly_path(@airline, @fly), status: :moved_permanently
  	end
  end

  def create
    params = fly_params
    params['airline'] = Airline.where(name: params['airline']).first
    @fly = Fly.new(params)
  	if @fly.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to airline_fly_path(params['airline'], @fly)
  	else
  		render 'new'
  	end
  end

  def edit
    @fly = Fly.friendly.find(params[:id])
    @model_name = controller_name.classify[0,1].downcase + controller_name.classify[1..-1]
  end

  def update
    @fly = Fly.friendly.find(params[:id])
    params = fly_params
    params['airline'] = Airline.where(name: params['airline']).first
    if @fly.update_attributes(params)
      flash[:success] = "Opportunity updated!"
      redirect_to airline_fly_path(params['airline'], @fly)
    else
      render 'edit'
    end
  end

  def index
    @flies = Airline.where(slug: params[:airline_id]).first.flies
  end

  private

  	def fly_params
  		params.require(:fly).permit(:airline, :name, :program_type, :duration, :post_graduation, {:website => []}, :hiring_status, :rating).tap do |whitelisted|
        whitelisted[:headings_attributes] = params[:fly][:headings_attributes]
      end
  	end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end

