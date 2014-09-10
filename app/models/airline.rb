class Airline < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	has_attached_file :logo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	has_many :flies

	validates :name, presence: true, length: {maximum: 60}
	VALID_LOGO_REGEX = /(\w+|\d+)\.png/
	validates :logo, presence: true, format: { with: VALID_LOGO_REGEX, message: "invalid logo format" }

  def should_generate_new_friendly_id?
    return true if send(friendly_id_config.slug_column).nil? && !send(friendly_id_config.base).nil?

    change = :"#{friendly_id_config.base}_changed?"
    return true if respond_to?(change) && send(change)

    false
  end
end
