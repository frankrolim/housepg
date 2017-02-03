class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :movie, foreign_key: true
      t.integer :quantity
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
