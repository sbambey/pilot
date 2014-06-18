class Heading < ActiveRecord::Base
	belongs_to :opportunity
	#has_many :paragraphs, as: :appendable
	#has_many :subheadings, as: :appendable
	has_many :subheadings
	accepts_nested_attributes_for :subheadings, allow_destroy: true
	#accepts_nested_attributes_for :paragraphs, allow_destroy: true
end
