require 'spec_helper'

describe "AirportPages" do
  
  subject { page }

  describe "add airport page" do
  	before { visit airports_new_path }

  	it { should have_content('Add airport') }
  end
end
