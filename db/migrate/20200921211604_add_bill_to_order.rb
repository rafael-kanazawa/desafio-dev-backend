class AddBillToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :bill, foreign_key: true
  end
end
