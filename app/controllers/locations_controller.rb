class LocationsController < ApplicationController

	def index
    @locations = Location.paginate(:per_page => 2, :page => params[:page]).order('created_at DESC')
  	end
end
