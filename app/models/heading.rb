class Heading < ActiveRecord::Base
	belongs_to :opportunity
	has_many :subheadings
	accepts_nested_attributes_for :subheadings, allow_destroy: true
end
