class OpportunitiesController < ApplicationController

  before_action :admin_user

  def new
  	@opportunity = Opportunity.new
    @model_name = controller_name.classify[0,1].downcase + controller_name.classify[1..-1]
    @opportunity.headings.build
  end

  def show
  	@opportunity = Opportunity.find(params[:id])
  end

  def create
    op = opportunity_params
    op['airline'] = Airline.where(airline_name: op['airline']).first
    @opportunity = Opportunity.new(op)
  	if @opportunity.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to @opportunity
  	else
  		render 'new'
  	end
  end

  def edit
    @opportunity = Airline.where(airline_name: params[:id]).first.opportunities.first
  end

  def update
    @opportunity = Airline.where(airline_name: params[:id]).first.opportunities.first
    op = opportunity_params
    op['airline'] = Airline.where(airline_name: op['airline']).first
    if @opportunity.update_attributes(op)
      flash[:success] = "Opportunity updated!"
      redirect_to @opportunity
    else
      render 'edit'
    end
  end

  def index
    @opportunities = Opportunity.all
  end

  private

  	def opportunity_params
  		params.require(:opportunity).permit(:airline, :opportunity_name, :program_type, :duration, :post_graduation, {:website => []}, :hiring_status, :rating).tap do |whitelisted|
        whitelisted[:headings_attributes] = params[:opportunity][:headings_attributes]
      end
  	end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
