class BillSerializer < ActiveModel::Serializer
  attributes :id, :amount, :bill_status, :table_number, :order_list
  
  def order_list
    self.object.orders.map do |order|
      {
        orderId: order.id,
        dishName: MenuItem.find(order.menu_item_id).dish_name,
        quantity: order.quantity,
        note: order.note,
        status: order.order_status
      }
    end
  end
end
