class AddBillToSale < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales, :bill, foreign_key: true
  end
end
