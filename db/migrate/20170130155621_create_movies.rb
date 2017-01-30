class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :runtime
      t.string :genre
      t.text :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster_url
      t.string :imdb_id
      t.string :imdb_rating

      t.timestamps
    end
  end
end
