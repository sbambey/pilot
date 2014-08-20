class Subheading < ActiveRecord::Base
	#belongs_to :appendable, polymorphic: true
	#has_many :paragraphs, as: :appendable
	belongs_to :heading
	has_many :paragraphs
	accepts_nested_attributes_for :paragraphs, allow_destroy: true
	#extend FriendlyId
end
