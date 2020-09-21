class AddTableToBill < ActiveRecord::Migration[5.1]
  def change
    add_reference :bills, :table, foreign_key: true
  end
end
