class RandomController < ApplicationController

  def index

    if logged_in?
    @review  = current_user.reviews.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    end


    if params[:busnotfound]
      @err_msg = "Oops, there is no restaurants around you"
    elsif params[:lonotfound]
      @err_msg = "Your location is not available"
    end
    
  end

  def search
    secrets = Rails.application.secrets

    client = Yelp::Client.new({consumer_key: secrets.yelp_consumer_key,
      consumer_secret: secrets.yelp_consumer_secret,
      token: secrets.yelp_token,
      token_secret: secrets.yelp_token_secret
      })

      @distance = params[:distance]
      if @distance
        cookies[:distance] = @distance
      else
        @distance = cookies[:distance]
      end

      # if location unavailable, redirect to index
      if cookies[:lat_lng] == nil
        redirect_to random_index_path(lonotfound: true)
      else
        lat_lng = cookies[:lat_lng].split("|")

        @user_lat = lat_lng[0]
        @user_lng = lat_lng[1]
        pref = { term: 'restaurants', radius_filter: @distance }
        coordinates = { latitude: @user_lat, longitude: @user_lng }
        results = client.search_by_coordinates(coordinates, pref)
        buses = results.businesses

        # if there's no businesses near user, redirect to index
        if buses.size == 0
          redirect_to random_index_path(busnotfound: true)
        else
          index = Random.rand(0...buses.size)
          bus = buses[index]
          @name = bus.name
          @bus_lat = bus.location.coordinate.latitude
          @bus_lng = bus.location.coordinate.longitude
          @img_url = bus.image_url
          @img_placeholder = 'http://bit.ly/2fkkakw'
        end

      end
    end

    def accept

      # if location unavailable, redirect to index
      if cookies[:lat_lng] == nil
        redirect_to random_index_path(lonotfound: true)
      else
        lat_lng = cookies[:lat_lng].split("|")

        @user_lat = lat_lng[0]
        @user_lng = lat_lng[1]
      end

      @destlat = params[:destlat]
      @destlong = params[:destlong]
      @img_url = params[:imgurl]
      @img_placeholder = 'http://bit.ly/2fkkakw'
      @name = params[:name]



      if params[:notatdest]
      @err_msg = "You are not at the destination"
      end
      
      

    end
    
    
    def success
    end
    
    def addpoints
      @current_user = current_user
      @points =  @current_user.point + 5
      @current_user.update_attribute(:point, @points)
      # change the flahs text in application.html.erb
      flash[:notice] = 'Congratulations!! You earn 5 points for finishing a challenge!'

      @location = Location.new
      @destlat = params[:destlat]
      @destlong = params[:destlong]
      @img_url = params[:imgurl]
      @img_placeholder = 'http://bit.ly/2fkkakw'
      @name = params[:name]

      @location.update_attribute(:name, @name)
      @location.update_attribute(:user_id, current_user.id)
      @location.update_attribute(:imgurl, @img_url)
      @location.update_attribute(:imgplaceholder, @img_placeholder)
      @location.update_attribute(:timestamp, DateTime.now.in_time_zone("Pacific Time (US & Canada)"))


      redirect_to controller: 'users', action: 'show', id: @current_user.id
      
      


    end

      
    helper_method :distance_between
  end
