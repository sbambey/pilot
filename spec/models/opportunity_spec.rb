require 'spec_helper'

describe Opportunity do
  
	before do
		@opp = Opportunity.new(opportunity_name: "Foo")
	end

	subject{@opp}

	it{should respond_to(:requirements)}
end