class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create		#comments form working, set up create action 
		@place = Place.find(params[:place_id])
		@place.comments.create(comment_params.merge(:user => current_user))
		#creates place.comments in database by comment_params
		redirect_to place_path(@place)
	end

	private

	def comment_params										#pull data out of comments form
		params.require(:comment).permit(:message, :rating)	#accesses message and rating forms 
	end
end
