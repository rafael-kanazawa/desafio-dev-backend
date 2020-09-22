class AddTableNumberToBill < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :table_number, :integer
  end
end
