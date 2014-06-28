require 'spec_helper'

describe Fly do

	let(:airline){FactoryGirl.create(:airline)}
  before do
		@fly = Fly.new(airline: airline, name: "Lufthansa Cadet Program")
	end

	subject{@fly}

	it{should respond_to(:airline)}
	it{should respond_to(:name)}
	it{should respond_to(:program_type)}
	it{should respond_to(:duration)}
	it{should respond_to(:post_graduation)}
	it{should respond_to(:website)}
	it{should respond_to(:hiring_status)}
	it{should respond_to(:rating)}

	

end
