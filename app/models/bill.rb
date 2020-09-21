class Bill < ApplicationRecord
    has_many :orders, dependent: :destroy
    belongs_to :table

    validates :bill_status, numericality: {only_integer: true}, presence: true, inclusion: { in: [0, 1]}
    validates :amount, numericality: true, presence: true
end
