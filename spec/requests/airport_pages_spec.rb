require 'spec_helper'

describe "AirportPages" do
  
  subject { page }

  describe "add airport page" do
    let(:user) {FactoryGirl.create(:user)}
  	before do
      sign_in user
      visit new_airport_path
    end

    it {should have_title(full_title('Add airport'))}
  	it { should have_content('Add an airport') }
  end

  describe "add airport" do
  	let(:submit) {"Add airport"}
    let(:user) {FactoryGirl.create(:user)}
    before do
      sign_in user
      visit new_airport_path
    end
    
  	describe "with invalid information" do
  		it "should not create an airport" do
  			expect {click_button submit}.not_to change(Airport, :count)
  		end
  	end

  	describe "with valid information" do
  		
  		before do
  			fill_in "Name",			with: "Example Airport"
  			fill_in "City",			with: "Foo"
  			fill_in "State", 		with: "Bar"
  			fill_in "Website",	with: "http://www.foobar.com"
  		end

  		it "should create an airport" do
  			expect {click_button submit}.to change(Airport, :count).by(1)
  		end
  	end
  end

  describe "show airport page" do
  	let(:airport) {FactoryGirl.create(:airport)}
  	before {visit airport_path(airport)}

    it {should have_title(full_title(airport.name))}
  	it {should have_content(airport.name)}
  	it {should have_content(airport.city)}
  	it {should have_content(airport.state)}
  	it {should have_content(airport.website)}
  end
end
