class LocationsController < ApplicationController

	def index
    @locations = @locations.paginate(:page => 1, :per_page => 2)

  end
end
