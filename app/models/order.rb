class Order < ApplicationRecord
    belongs_to :bill
    belongs_to :menu_item

    validates :status, :quantity, :bill_id, numericality: {only_integer: true}, presence: true
    validates :note, presence: true
end
