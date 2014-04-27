require 'spec_helper'

describe Opportunity do
  
	before do
		@opp = Opportunity.new(name: "Lufthansa Cadet Pilot Program", company: "Deutsche Lufthansa AG", logo: "lufthansa_logo.png",
			program_type: "Cadet Program", duration: "29 to 33 months", post_graduation: "MPL and job offer for Lufthansa/Germanwings",
			website: "http://lufthansa-pilot.de", rating: "9.5", 
			general_information: "The Lufthansa Cadet Pilot Program is a program offered by <em>Deutsche Lufthansa AG</em>. 
			It is available to individuals over the age of 17 holding a European passport, having the right of umlimited residency of Germany 
			or holding an indefinite residency permit for Germany...",
			requirements:{"Education" => 	
				"General or subject specific qualification for university entrance (Allgemeine oder fachgebundene Hochschulreife),
				advanced technical college entrance qualification (Fachhochschulreife) does not suffice. No numerus clausus required",
				"Spoken languages" => "Fluent in German and English"},
			medical_requirements:{"Something" => "Something", "Something else" => "Something else"},
			additional:{"Foo" => ["Bar", "Barcode", "Lovely"], "Bar" => "Foo"})
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
	it{should respond_to(:requirements)}
	it{should respond_to(:medical_requirements)}
	it{should respond_to(:additional)}

	context "when name is not present" do
		before{@opp.name = " "}
		it{should_not be_valid}
	end

	context "when name is too long" do
		before{@opp.name = "a"*31}
		it{should_not be_valid}
	end

	context "when name is not unique" do
		before do
			opp_with_same_name = @opp.dup
			opp_with_same_name.save
		end
		it{should_not be_valid}
	end

	context "when company is not present" do
		before{@opp.company = " "}
		it{should_not be_valid}
	end

	context "when logo isn't present" do
		before{@opp.logo = " "}
		it{should_not be_valid}
	end

	context "when logo format is invalid" do
		it "should be invalid" do
			addresses = %w[png .png tst.tif]
			addresses.each do |invalid_address|
				@opp.logo = invalid_address
				expect(@opp).not_to be_valid
			end
		end
	end

	context "when logo format is valid" do
		it "should be valid" do
			addresses = %w[someimage.png t.png lft-logo.png]
			addresses.each do |valid_address|
				@opp.logo = valid_address
				expect(@opp).to be_valid
			end
		end
	end

	context "when program_type is not present" do
		before{@opp.program_type = " "}
		it{should_not be_valid}
	end

	context "when program_type is too long" do
		before{@opp.program_type = "a"*51}
		it{should_not be_valid}
	end

	context "when duration is not present" do
		before{@opp.duration = " "}
		it{should_not be_valid}
	end

	context "when duration is too long" do
		before{@opp.duration = "a"*51}
		it{should_not be_valid}
	end

	context "when post_graduation is not present" do
		before{@opp.post_graduation = " "}
		it{should_not be_valid}
	end

	context "when post_graduation is too long" do
		before{@opp.post_graduation = "a"*101}
		it{should_not be_valid}
	end

	context "when website is not present" do
		before{@opp.website = " "}
		it{should_not be_valid}
	end

	context "when website format in invalid" do
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

	context "when rating is not present" do
		before{@opp.rating = nil}
		it{should_not be_valid}
	end

	context "when rating is" do
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

	context "when general_information is not present" do
		before{@opp.general_information = " "}
		it{should_not be_valid}
	end

	context "when general_information is too long" do
		before{@opp.general_information = "a" * 1801}
		it{should_not be_valid}
	end

	context "when requirements is not present" do
		it "should be empty" do
			@opp.requirements = {}
			@opp.save
			expect(@opp.reload.requirements).to be_empty
		end
	end

	context "when requirements are present" do
		let(:hash) {{"Foo" => "Bar", "Bar" => "Foo"}}
		it "should properly serialize them" do
			@opp.requirements = hash
			@opp.save
			@opp.reload.requirements.should eq(hash)
		end
	end

	context "when medical_requirements is not present" do
		it "should be empty" do
			@opp.medical_requirements = {}
			@opp.save
			expect(@opp.reload.medical_requirements).to be_empty
		end
	end

	context "when medical_requirements are present" do
		let(:hash) {{"Foo" => "Bar", "Bar" => "Foo"}}
		it "should properly serialize them" do
			@opp.medical_requirements = hash
			@opp.save
			@opp.reload.medical_requirements.should eq(hash)
		end
	end

	context "when additional is not present" do
		it "should be empty" do
			@opp.additional = {}
			@opp.save
			expect(@opp.reload.additional).to be_empty
		end
	end

	context "when additionals are present" do
		let(:hash) {{"Foo" => ["Bar", "Barcode", "Lovely"], "Bar" => "Foo"}}
		it "should properly serialize them" do
			@opp.additional = hash
			@opp.save
			@opp.reload.additional.should eq(hash)
		end
	end
end