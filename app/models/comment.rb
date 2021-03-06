class Comment < ActiveRecord::Base
	 belongs_to :user
	 belongs_to :place
#	 after_create :send_comment_email
#	 after_create :mark_associated_item
#	 after_initialize :setup_identifier

	validates :message, :uniqueness => true
	scope :with_message, -> { where("message is not null and message != ''") }

	 RATINGS = {
	 	'one star' 		=> 1,			#user sees value on the left, right stored in database
	 	'two stars'		=> 2,
	 	'three stars'	=> 3,
	 	'four stars'	=> 4,
	 	'five stars'	=> 5
	 }

	def humanized_rating						#inverts table for RATINGS
		RATINGS.invert[self.rating]				#calling .rating on self
	end											#more verbose to put self, pulls in rating

	def send_comment_email
		NotificationMailer.comment_added(self).deliver
	end

	def neg_rating
		(rating-5).abs
	end


#	 def mark_associated_item
#	 	similar_places = Place.where(:name => self.place.name)
#	 	similar_places.each do |place|
#	 		place.comments.where(:identifier => self.identifier).blank?
#	 		place.comments.create(:identifier => self.identifier,
#	 			:message => self.message, :rating => self.rating,
#	 			:user_id => self.user_id
#	 			#run migration of unique_id
#	 end
#
#	 def setup_identifier
#	 setup_identifier = SecureRandom.hex(16)
#	end

end