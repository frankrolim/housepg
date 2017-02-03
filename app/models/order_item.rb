class OrderItem < ApplicationRecord
  belongs_to :movie
  belongs_to :cart
  belongs_to :order

  after_commit on: :update  do |order_item|
    order_item.destroy! if order_item.quantity <= 0
  end

  def price
    self.movie.price
  end

  def total
    self.movie.price * self.quantity
  end

end
