class Order < ApplicationRecord
    belongs_to :bill
    belongs_to :menu_item

    validates :quantity, :bill_id, numericality: {only_integer: true}, presence: true
    validates :note, presence: true
    validates :status, numericality: {only_integer: true}, presence: true, inclusion: { in: [0, 1]}
end
