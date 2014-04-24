require 'spec_helper'

describe Opportunity do
  
	before do
		@opp = Opportunity.new(name: "Lufthansa Cadet Pilot Program", company: "Deutsche Lufthansa AG", logo: "lufthansa_logo.png",
			program_type: "Cadet Program", duration: "29 to 33 months", post_graduation: "MPL and job offer for Lufthansa/Germanwings",
			website: "http://lufthansa-pilot.de", rating: "9.5", 
			general_information: "The Lufthansa Cadet Pilot Program is a program offered by <em>Deutsche Lufthansa AG</em>. 
			It is available to individuals over the age of 17 holding a European passport, having the right of umlimited residency of Germany 
			or holding an indefinite residency permit for Germany...")
	end

	subject {@opp}

	it{should respond_to(:name)}
	it{should respond_to(:company)}
	it{should respond_to(:logo)}
	it{should respond_to(:program_type)}
	it{should respond_to(:duration)}
	it{should respond_to(:post_graduation)}
	it{should respond_to(:website)}
	it{should respond_to(:rating)}
	it{should respond_to(:general_information)}

	describe "when name is not present" do
		before{@opp.name = " "}
		it{should_not be_valid}
	end

	describe "when name is too long" do
		before{@opp.name = "a"*31}
		it{should_not be_valid}
	end

	describe "when name is not unique" do
		before do
			opp_with_same_name = @opp.dup
			opp_with_same_name.save
		end
		it{should_not be_valid}
	end

	describe "when company is not present" do
		before{@opp.company = " "}
		it{should_not be_valid}
	end

	describe "when logo isn't present" do
		before{@opp.logo = " "}
		it{should_not be_valid}
	end

	describe "when logo format is invalid" do
		it "should be invalid" do
			addresses = %w[png .png tst.tif]
			addresses.each do |invalid_address|
				@opp.logo = invalid_address
				expect(@opp).not_to be_valid
			end
		end
	end

	describe "when logo format is valid" do
		it "should be valid" do
			addresses = %w[someimage.png t.png lft-logo.png]
			addresses.each do |valid_address|
				@opp.logo = valid_address
				expect(@opp).to be_valid
			end
		end
	end

	describe "when program_type is not present" do
		before{@opp.program_type = " "}
		it{should_not be_valid}
	end

	describe "when program_type is too long" do
		before{@opp.program_type = "a"*51}
		it{should_not be_valid}
	end

	describe "when duration is not present" do
		before{@opp.duration = " "}
		it{should_not be_valid}
	end

	describe "when duration is too long" do
		before{@opp.duration = "a"*51}
		it{should_not be_valid}
	end

	describe "when post_graduation is not present" do
		before{@opp.post_graduation = " "}
		it{should_not be_valid}
	end

	describe "when post_graduation is too long" do
		before{@opp.post_graduation = "a"*101}
		it{should_not be_valid}
	end

	describe "when website is not present" do
		before{@opp.website = " "}
		it{should_not be_valid}
	end

	describe "when website format in invalid" do
		it "should be invalid" do
			addresses = %w[htttps://test.com http:/test.com http://test. test.com]
			addresses.each do |invalid_address|
				@opp.website = invalid_address
				expect(@opp).not_to be_valid
			end
		end
	end

	describe "when logo format is valid" do
		it "should be valid" do
			addresses = %w[http://test.com https://test.com http://some-test.c]
			addresses.each do |valid_address|
				@opp.website = valid_address
				expect(@opp).to be_valid
			end
		end
	end

	describe "when rating is not present" do
		before{@opp.rating = nil}
		it{should_not be_valid}
	end

	describe "when rating is" do
		describe "too small" do
			it "should be invalid" do
				@opp.rating = -0.5
				expect(@opp).not_to be_valid
			end
		end

		describe "too large" do
			it "should be invalid" do
				@opp.rating = 10.5
				expect(@opp).not_to be_valid
			end
		end

		describe "in range" do
			it "should be valid" do
				@opp.rating = 9.5
				expect(@opp).to be_valid
			end
		end
	end

	describe "when general_information is not present" do
		before{@opp.general_information = " "}
		it{should_not be_valid}
	end

	describe "when general_information is too long" do
		before{@opp.general_information = "a" * 1801}
		it{should_not be_valid}
	end
end