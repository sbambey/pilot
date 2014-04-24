module OpportunitiesHelper
	def rating(rating)
		if rating>9
			level = "ruby"
		elsif rating>7.5
			level =  "gold"
		elsif rating>6
			level = "silver"
		else
			level = "bronze"
		end
		content_tag(:span, 
			image_tag("#{level}.png", :class => "rating-icon") + level[0].capitalize + level[1..-1] + " Level Opportunity", 
			:class => "rating-badge #{level}")
	end
end
