require 'spec_helper'

describe "OpportunityPages" do
  
	subject {page}

	describe "Opportunity page" do
		let(:user){FactoryGirl.create(:user)}
		let(:opp){FactoryGirl.create(:opportunity)}
		before do
			sign_in user
			visit opportunity_path(opp)
		end

		it{should have_title(full_title(opp.name))}
		it{should have_content(opp.name)}
		it{should have_selector("span.#{rating_css(opp.rating)}", text: rating_text(opp.rating))}

		describe "Top level table" do
			subject{page.find(:css, 'table', :match => :first)}
			it{should have_selector('td:nth-child(1)', text: opp.program_type)}
			it{should have_selector('td:nth-child(2)', text: opp.duration)}
			it{should have_selector('td:nth-child(3)', text: opp.post_graduation)}
			it{should have_selector("td:nth-child(4) a[href='#{opp.website}']", text: opp.website)}
		end

		it{should have_selector("div.standard-box", text: "General Information")}
		it{should have_content(opp.general_information)}
	end
end
