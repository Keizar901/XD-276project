class RandomController < ApplicationController

  def index
    if params[:notfound]
      @err_msg = "Sorry, there is no restaurants around you"
    end
  end

  def search
    client = Yelp::Client.new({consumer_key: 'FAWYz3fLKNkJk8y9hov-HQ',
      consumer_secret: 'IMSJ9Gtj-N4C7LiOeOOu8i3YVnk',
      token: '6gU0xJzU096r-ImUQXV5694Vj7RLipDk',
      token_secret: 's8SSdbNje6DN5Q4EfAtM7YgRye4'
      })

      @distance = params[:distance]
      if @distance
        cookies[:distance] = @distance
      else
        @distance = cookies[:distance]
      end
      
      lat_lng = cookies[:lat_lng].split("|")
      @user_lat = lat_lng[0]
      @user_lng = lat_lng[1]
      pref = { term: 'restaurants', radius_filter: @distance }
      coordinates = { latitude: @user_lat, longitude: @user_lng }
      results = client.search_by_coordinates(coordinates, pref)
      buses = results.businesses

      if buses.size > 0
        index = Random.rand(0...buses.size)
        bus = buses[index]
        @name = bus.name
        @bus_lat = bus.location.coordinate.latitude
        @bus_lng = bus.location.coordinate.longitude
        @img_url = bus.image_url
        @img_placeholder = 'http://bit.ly/2fkkakw'
      else
        redirect_to random_index_path(notfound: true)
      end


    end
  end
