class SearchController < ApplicationController
  def index
  end

  def result
    @prev_search_key = params[:search_key]
    @results = User.where('lower(fname) = ?', @prev_search_key)
    @results += User.where('lower(lname) = ?', @prev_search_key)
    @results += User.where('lower(email) = ?', @prev_search_key)
    @results.uniq! # remove ducplicates from the results it self
  end
end
