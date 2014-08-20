class Paragraph < ActiveRecord::Base
	#belongs_to :appendable, polymorphic: true
	belongs_to :subheading
	#extend FriendlyId
end
