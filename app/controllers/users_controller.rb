class UsersController < ApplicationController

	def show			#add show action, as called in routes
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

end