class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :directors

  def self.search(query)
    self.where('title LIKE ?', "%#{query}%").order('id DESC')
  end
end
