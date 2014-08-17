class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  geocoded_by :address
  after_validation :geocode

	validates :name, :description, :presence => true, :uniqueness => true
	validates :name, length: { in: 5..25 }
	validates :description, length: { in: 20..200 }


	def average_rating
		Comment.where(:place_id => self.id).average(:rating).to_f
	end

	def neg_rating
		(average_rating-5).ceil.abs
	end

	def sorter
		my_places=self.places.sort do |x,y|
		y.place.average_rating <=> x.place.average_rating
  		end
	end
end