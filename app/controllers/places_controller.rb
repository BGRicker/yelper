class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy	]

	def index
		@places = Place.all 		#creates variable of all Places
		@places = Place.paginate(:page => params[:page], :per_page => 5)
	end

	def new
		@place=Place.new
	end

	def create
		@place = current_user.places.create(place_params) 
		if @place.valid?										#if checks if validation passes, send to root
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity		#send back to form 
		end
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
	end

	def update
		@place = Place.find(params[:id])		#find specified post

		if @place.user != current_user			#if user isn’t the current_user
    		return render :text => 'Not Allowed', :status => :forbidden
  		end

		@place.update_attributes(place_params)	#update_attributes for specified post
		redirect_to root_path					#redirect_to root (home)
	end

	def destroy
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end

		@place.destroy
		redirect_to root_path
	end


	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end
end
