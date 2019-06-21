module DishesHelper
	def tags_of_meals
		["STARTER", "MAIN", "DESSERT", "DRINK"]
	end

	def tags_of_dietarian
		["VEGETARIAN", "VEGAN", "GLUTEN FREE"]
	end

	def tags_order
		["STARTER", "MAIN", "DESSERT", "DRINK","VEGETARIAN", "VEGAN", "GLUTEN FREE"]
	end

	def get_tags_in_order dish
		dish.tags.sort_by do |element|
		  tags_order.index(element.name)
		end
	end

	def user_rating_in_int comment
		rating = @dish.rating_for comment.user
		(rating % 1) > 0 ? rating : rating.to_i
	end

	def time_in_words(date)
		word = time_ago_in_words(date) + ' ago'
		word.include?("about ") ? word.slice!("about ") : nil
		word = word == "less than a minute ago" ? "0 minutes ago" : word
		return word
	end

end
