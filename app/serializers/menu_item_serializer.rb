class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :dish_name, :description, :price, :url_image, :dish_category

  def dish_category
    {
      dishCategory: self.object.category.designation,
      categoryId: self.object.category.id
    }
  end
end
