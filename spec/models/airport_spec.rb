require 'spec_helper'

describe Airport do
  
	before { @airport = Airport.new(name: "Daytona Beach International Airport", city: "Daytona Beach", state: "Florida", website: "http://www.flydaytonafirst.com") }

	subject { @airport }

	it { should respond_to(:name) }
	it { should respond_to(:city) }
	it { should respond_to(:state) }
	it { should respond_to(:website) }

	it { should be_valid }

	describe "when name is not present" do
		before {@airport.name = " "}
		it {should_not be_valid}
	end

	describe "when city is not present" do
		before {@airport.city = " "}
		it {should_not be_valid}
	end

	describe "when state is not present" do
		before {@airport.state = " "}
		it {should_not be_valid}
	end

	describe "when name is too long" do
		before {@airport.name = "a" * 101}
		it {should_not be_valid}
	end

	describe "when city is too long" do
		before {@airport.city = "a" * 51}
		it {should_not be_valid}
	end

	describe "when state is too long" do
		before {@airport.state = "a" * 21}
		it {should_not be_valid}
	end

	describe "when name is not unique" do
		before do
			airport_with_same_name = @airport.dup
			airport_with_same_name.save
		end
		it{should_not be_valid}
	end


end
