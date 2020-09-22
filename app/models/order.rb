class Order < ApplicationRecord
    belongs_to :bill
    belongs_to :menu_item

    validates :quantity, :bill_id, :menu_item_id, numericality: {only_integer: true, greater_than_or_equal_to: 0}, presence: true
    validates :note, presence: true, format: {with: /\A[A-Za-z]+\z/, message: "Only letters are allowed"}
    validates :order_status, numericality: {only_integer: true}, presence: true, inclusion: { in: [0, 1]}
end
