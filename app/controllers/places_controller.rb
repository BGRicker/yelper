class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		@places = Place.all 		#creates variable of all Places
		@places = Place.paginate(:page => params[:page], :per_page => 5)
	end

	def new
		@place=Place.new
	end

	def create
		current_user.places.create(place_params)
		# Place.create(place_params) old code before associating users with places (above)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])		#find specified post
		@place.update_attributes(place_params)	#update_attributes for specified post
		redirect_to root_path					#redirect_to root (home)
	end

	def destroy
		@place = Place.find(params[:id])
		#@place destroy
		#redirect_to root_path
	end


	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end
end
