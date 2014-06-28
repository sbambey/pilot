class Fly < ActiveRecord::Base
	belongs_to :airline
	has_many :headings
	accepts_nested_attributes_for :headings, allow_destroy: true

	serialize :website, Array
end
