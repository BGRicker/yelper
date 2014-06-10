class PlacesController < ApplicationController
	def index
		@places = Place.all 		#creates variable of all Places
	end
end
