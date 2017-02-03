class AddPriceToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :price, :float
  end
end
