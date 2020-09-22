class CompleteBillSerializer < ActiveModel::Serializer
  attributes :id, :amount, :bill_status, :table_number, :table_id, :order_list
  
  def order_list
    self.object.orders.map do |order|
      {
        orderId: order.id,
        dishName: MenuItem.find(order.menu_item_id).dish_name,
        note: order.note,
        quantity: order.quantity,
        amount: order.amount,
        status: order.order_status
      }
    end
  end
end
