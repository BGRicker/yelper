class Comment < ActiveRecord::Base
	 belongs_to :user
	 belongs_to :place


	 RATINGS = {
	 	'one star' 		=> '1_star',			#user sees value on the left, right stored in database
	 	'two stars'		=> '2_stars',
	 	'three stars'	=> '3_stars',
	 	'four stars'	=> '4_stars',
	 	'five stars'	=> '5_stars'
	 }

	 def humanized_rating						#inverts table for RATINGS
	 	RATINGS.invert[self.rating]				#calling .rating on self
	 end
end
