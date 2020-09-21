class Bill < ApplicationRecord
    has_many :orders, dependent: :destroy
    belongs_to :table

    validates :status, numericality: {only_integer: true}, presence: true
    validates :amount, numericality: true, presence: true
end
