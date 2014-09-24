class Fly < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: [:slugged, :history]
	
	belongs_to :airline
	has_many :headings
	accepts_nested_attributes_for :headings, allow_destroy: true

	serialize :website, Array

	def should_generate_new_friendly_id?
    return true if send(friendly_id_config.slug_column).nil? && !send(friendly_id_config.base).nil?

    change = :"#{friendly_id_config.base}_changed?"
    return true if respond_to?(change) && send(change)

    false
  end

  def slug_candidates
    [
      :name,
      [:name, :program_type],
    ]
  end
end