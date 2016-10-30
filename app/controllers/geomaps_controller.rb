class GeomapsController < ApplicationController
  def index
  	@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  		marker.lat user.latitude
  		marker.lng user.longitude
  	end
  end

  def directions
  #	response = Yelp.client.search('Coquitlam')
  #	@lat = response.businesses[0].name
  #	@lat = response.businesses[0].locaton.coordinate.latutude
  #	@long = response.businesses[0].locaton.coordinate.longitude
  end
end
