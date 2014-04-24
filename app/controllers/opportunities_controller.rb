class OpportunitiesController < ApplicationController
  def new
  	@opportunity = Opportunity.new
  end

  def show
  	@opportunity = Opportunity.find(params[:id])
  end
end
