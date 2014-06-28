class FliesController < ApplicationController

  #before_action :admin_user

  def new
  	@fly = Fly.new
    @model_name = controller_name.classify[0,1].downcase + controller_name.classify[1..-1]
    @fly.headings.build
  end

  def show
  	@fly = Fly.find(params[:id])
  end

  def create
    params = fly_params
    params['airline'] = Airline.where(airline_name: params['airline']).first
    @fly = Fly.new(op)
  	if @fly.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to @fly
  	else
  		render 'new'
  	end
  end

  def edit
    @fly = Fly.find(params[:id])
  end

  def update
    @fly = Fly.find(params[:id])
    params = fly_params
    params['airline'] = Airline.where(airline_name: params['airline']).first
    if @fly.update_attributes(op)
      flash[:success] = "Opportunity updated!"
      redirect_to @fly
    else
      render 'edit'
    end
  end

  def index
  	if params.has_key?(:airline_id)
    	@flies = Airline.where(name: params[:airline_id]).first.flies
    end
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

