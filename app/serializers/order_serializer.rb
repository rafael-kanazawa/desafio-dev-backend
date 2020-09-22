class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :note, :amount, :order_status, :order_menu_item

  def order_menu_item
    {
      dishName: self.object.menu_item.dish_name,
      price: self.object.menu_item.price,
      description: self.object.menu_item.description,
      urlImage: self.object.menu_item.url_image,
      dishCategory: Category.find(self.object.menu_item.category_id).designation
    }
  end
end
