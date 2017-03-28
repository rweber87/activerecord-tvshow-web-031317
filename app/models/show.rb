class Show < ActiveRecord::Base

	def self.highest_rating
		self.shows_order_by.last[:rating]
	end

	def self.most_popular_show
		self.shows_order_by.last
	end

	def self.lowest_rating
		self.shows_order_by.first[:rating]
	end

	def self.shows_order_by
		show = self.all.sort_by {|show| show.rating}
	end

	def self.least_popular_show
		self.shows_order_by.first
	end

	def self.ratings_sum
		self.all.map {|show| show.rating}.inject {|sum, n| sum + n}
	end

	def self.popular_shows
		self.all.reject {|show| show.rating < 5}
	end

	def self.shows_by_alphabetical_order
		self.all.sort_by{ |show| show.name}
	end
end