class OpportunitiesController < ApplicationController

  def new
  	@opportunity = Opportunity.new
    @model_name = controller_name.classify[0,1].downcase + controller_name.classify[1..-1]
  end

  def show
  	@opportunity = Opportunity.find(params[:id])
  end

  def create
    op = opportunities_params
    op['airline'] = Airline.where(airline_name: op['airline']).first
    @opportunity = Opportunity.new(op)
    lala
  	if @opportunity.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to @opportunity
  	else
  		render 'new'
  	end
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
  end

  private

  	def opportunities_params
  		params.require(:opportunity).tap do |whitelisted|
        whitelisted[:bla] = params[:opportunities][:bla]
      end
  	end
end
