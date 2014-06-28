# require 'spec_helper'

# describe "OpportunityPages" do
  
# 	subject {page}

# 	describe "- Opportunity page" do
# 		let(:user){FactoryGirl.create(:user)}
# 		let(:opp){FactoryGirl.create(:opportunity)}
# 		before do
# 			sign_in user
# 			visit opportunity_path(opp)
# 		end

# 		it{should have_title(full_title(opp.name))}
# 		it{should have_content(opp.name)}
# 		it{should have_selector("span.#{rating_css(opp.rating)}", text: rating_text(opp.rating))}

# 		describe "basic information table" do
# 			subject{page.find(:css, 'table', :match => :first)}
# 			it{should have_selector('td:nth-child(1)', text: opp.program_type)}
# 			it{should have_selector('td:nth-child(2)', text: opp.duration)}
# 			it{should have_selector('td:nth-child(3)', text: opp.post_graduation)}
# 			it{should have_selector("td:nth-child(4) a[href='#{opp.website}']", text: opp.website)}
# 		end

# 		it{should have_selector("div.standard-box", text: "General Information")}
# 		it{should have_content(opp.general_information)}

# 		describe "requirements table" do
# 			describe "with requirements" do
# 				it "should display the table properly" do
# 					should have_selector('table#requirements tr', count: opp.requirements.length)
# 				end
# 			end
# 			describe "with no requirements" do
# 				let(:opp_without_req){FactoryGirl.create(:opportunity, name: "Another name", requirements: {})}
# 				before{visit opportunity_path(opp_without_req)}
# 				it{should_not have_selector('table#requirements')}
# 			end
# 		end

# 		describe "medical requirements table" do
# 			describe "with requirements" do
# 				it "should display the table properly" do
# 					should have_selector('table#medical_requirements tr', count: opp.medical_requirements.length)
# 				end
# 			end
# 			describe "with no requirements" do
# 				let(:opp_without_req){FactoryGirl.create(:opportunity, name: "Another name", medical_requirements: {})}
# 				before{visit opportunity_path(opp_without_req)}
# 				it{should_not have_selector('table#medical_requirements')}
# 			end
# 		end

# 		describe 'additional information' do
# 			context 'with additionals' do
# 				let(:i){0}
# 				it 'displays paragraphs' do
# 					opp.additional.each_with_index do |(key, value),index|
# 						expect(page).to have_content(key)
# 						expect(page).to have_selector("#additional_#{index}")
# 						expect(page).to have_selector("#additional_#{index} p", count: value.length)
# 					end
# 				end
# 			end
# 		end
# 	end
# end
