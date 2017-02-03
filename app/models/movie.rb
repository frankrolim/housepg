class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :directors
  has_many :order_itens

  def self.search(query)
    self.where('title LIKE ?', "%#{query}%").order('id DESC')
  end

  def to_s
    self.title
  end
end
