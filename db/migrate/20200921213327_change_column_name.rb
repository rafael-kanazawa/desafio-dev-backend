class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :bill, :staus, :status
  end
end
