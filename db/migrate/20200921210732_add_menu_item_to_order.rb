class AddMenuItemToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :menu_item, foreign_key: true
  end
end
