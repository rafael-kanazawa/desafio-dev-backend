class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.float :amount
      t.integer :staus

      t.timestamps
    end
  end
end
