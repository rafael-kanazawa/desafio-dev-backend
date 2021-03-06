class Order < ApplicationRecord
    belongs_to :bill
    belongs_to :menu_item

    validates :quantity, :bill_id, :menu_item_id, numericality: {only_integer: true, greater_than_or_equal_to: 0}, presence: true, on: :create
    validates :note, format: {with: /\A[A-Z a-z]+\z/, message: "Only letters are allowed"}, on: [:create, :update]
    validates :order_status, numericality: {only_integer: true}, inclusion: { in: [0, 1]}, on: :update
end
