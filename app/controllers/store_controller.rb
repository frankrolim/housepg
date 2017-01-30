class StoreController < ApplicationController
  def index
    @movies = Movie.all.sample(10)
  end
end
