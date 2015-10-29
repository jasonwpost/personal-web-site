module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "Jason Post - Composer, Sound Artist, Developer"
		if page_title.empty? #boolean check
			base_title
		else
			page_title + " | " + base_title
		end
	end
end
