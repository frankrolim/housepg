class Cart < ApplicationRecord
  include Priceable

  belongs_to :user
  has_many :order_items
end
