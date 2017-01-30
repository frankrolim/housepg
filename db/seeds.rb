# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Movie.delete_all
Director.delete_all

CSV.foreach(Rails.root.join("db/seeds_data/movies.csv"), headers: false) do |m|
  puts "#{m[0]}"
  movie = Movie.create({
      title: m[0],
      year: m[1],
      runtime: m[2],
      genre: m[3],
      plot: m[4],
      language: m[5],
      country: m[6],
      awards: m[7],
      poster_url: m[8],
      imdb_id: m[9],
      imdb_rating: m[10]
    }
  )

  m[11].split(",").each do |director|
    movie.directors << Director.find_or_create_by({name: director})
    movie.save!
  end

  m[12].split(",").each do |actor|
    movie.actors << Actor.find_or_create_by({name: actor})
    movie.save!
  end
end
