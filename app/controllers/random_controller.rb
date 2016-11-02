class RandomController < ApplicationController
  def index
    client = Yelp::Client.new({consumer_key: 'FAWYz3fLKNkJk8y9hov-HQ',
                            consumer_secret: 'IMSJ9Gtj-N4C7LiOeOOu8i3YVnk',
                            token: '6gU0xJzU096r-ImUQXV5694Vj7RLipDk',
                            token_secret: 's8SSdbNje6DN5Q4EfAtM7YgRye4'
                          })
    @response = client.search('Burnaby')

  end
end
