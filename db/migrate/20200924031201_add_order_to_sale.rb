class AddOrderToSale < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales, :order, foreign_key: true
  end
end
