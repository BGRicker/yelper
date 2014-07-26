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
		(average_rating-5).abs
	end

end