class Opportunity < ActiveRecord::Base
	serialize :requirements
	serialize :medical_requirements
	serialize :additional

	validates :name, presence: true, length: { maximum: 30 }, uniqueness:true
	validates :company, presence: true
	VALID_LOGO_REGEX = /(\w+|\d+)\.png/
	validates :logo, presence: true, format: { with: VALID_LOGO_REGEX, message: "invalid logo format" }
	validates :program_type, presence: true, length:{maximum:50}
	validates :duration, presence:true, length:{maximum:50}
	validates :post_graduation, presence:true, length:{maximum:100}
	VALID_URL_REGEX = /(http|https):\/\/[^.]+\.\w+/
	validates :website, presence: true, format: {with: VALID_URL_REGEX, message: "invalid URL format"}
	validates :rating, presence: true
	validates_inclusion_of :rating, in: 0..10
	validates :general_information, presence: true, length: {maximum:1800}
end
