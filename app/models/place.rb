class Place < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

	validates :name, :description, :presence => true
	validates :name, length: { in: 5..25 }
	validates :description, length: { in: 20..200 }
end

