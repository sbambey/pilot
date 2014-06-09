require 'spec_helper'

describe Requirement do
	
  let(:opportunity){FactoryGirl.create(:opportunity)}

  before do
  	@req = opportunity.requirements.build(title: "Foo", content: "This requires bar")
  end

  subject {@req}

  it {should respond_to(:title)}
  it {should respond_to(:content)}
  its(:opportunity){should eq opportunity}
end
