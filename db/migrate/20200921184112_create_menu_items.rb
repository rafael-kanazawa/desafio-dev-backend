class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :dish_name
      t.float :price
      t.text :description
      t.string :url_image

      t.timestamps
    end
  end
end
