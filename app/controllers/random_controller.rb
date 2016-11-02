class RandomController < ApplicationController
  def index

  end

  def search
    client = Yelp::Client.new({consumer_key: 'FAWYz3fLKNkJk8y9hov-HQ',
                            consumer_secret: 'IMSJ9Gtj-N4C7LiOeOOu8i3YVnk',
                            token: '6gU0xJzU096r-ImUQXV5694Vj7RLipDk',
                            token_secret: 's8SSdbNje6DN5Q4EfAtM7YgRye4'
                          })
    @distance = params[:distance]
    @lat_lng = cookies[:lat_lng].split("|")

    pref = {
      term: 'restaurants',
      radius: @distance
    }
    coordinates = { latitude: @lat_lng[0], longitude: @lat_lng[1] }

    @results = client.search_by_coordinates(coordinates, pref);
  end
end
