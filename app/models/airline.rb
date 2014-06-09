class Airline < ActiveRecord::Base

	has_many :opportunities

	validates :airline_name, presence: true, length: {maximum: 60}
	VALID_LOGO_REGEX = /(\w+|\d+)\.png/
	validates :logo, presence: true, format: { with: VALID_LOGO_REGEX, message: "invalid logo format" }
end
