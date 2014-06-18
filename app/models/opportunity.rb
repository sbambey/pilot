class Opportunity < ActiveRecord::Base
	has_many :headings
	belongs_to :airline
	accepts_nested_attributes_for :headings, allow_destroy: true

	serialize :website, Array

	#validates :opportunity_name, presence: true, length: { maximum: 30 }, uniqueness:true
	#validates :program_type, presence: true, length:{maximum:50}
	#validates :duration, presence:true, length:{maximum:50}
	#validates :post_graduation, presence:true, length:{maximum:100}
	#VALID_URL_REGEX = /(http|https):\/\/[^.]+\.\w+/
	#validates :website, presence: true, format: {with: VALID_URL_REGEX, message: "invalid URL format"}
	#validates :rating, presence: true
	#validates_inclusion_of :rating, in: 0..10
	#validates :general_information, presence: true, length: {maximum:1800}
end
