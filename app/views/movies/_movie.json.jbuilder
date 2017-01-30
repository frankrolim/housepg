json.extract! movie, :id, :title, :year, :runtime, :genre, :plot, :language, :country, :awards, :poster_url, :imdb_id, :imdb_rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)