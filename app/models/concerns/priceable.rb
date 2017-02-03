module Priceable
    extend ActiveSupport::Concern

    def total
      total = 0.0
      self.order_items.each do |order_item|
        total += order_item.total
      end
      total
    end
end
