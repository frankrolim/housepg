require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { awards: @movie.awards, country: @movie.country, genre: @movie.genre, imdb_id: @movie.imdb_id, imdb_rating: @movie.imdb_rating, language: @movie.language, plot: @movie.plot, poster_url: @movie.poster_url, runtime: @movie.runtime, title: @movie.title, year: @movie.year } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { awards: @movie.awards, country: @movie.country, genre: @movie.genre, imdb_id: @movie.imdb_id, imdb_rating: @movie.imdb_rating, language: @movie.language, plot: @movie.plot, poster_url: @movie.poster_url, runtime: @movie.runtime, title: @movie.title, year: @movie.year } }
    assert_redirected_to movie_url(@movie)
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to movies_url
  end
end
