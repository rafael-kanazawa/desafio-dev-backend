class AddCategoryToMenuItem < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_items, :category, :reference
  end
end
