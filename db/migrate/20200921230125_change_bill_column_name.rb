class ChangeBillColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :bills, :status, :bill_status
  end
end
