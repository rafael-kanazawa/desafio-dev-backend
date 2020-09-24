class Sale < ApplicationRecord
  belongs_to :bill

  validates :bill_id, presence: true, numericality: {only_integer: true}, on: :create
end
