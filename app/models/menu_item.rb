class MenuItem < ApplicationRecord
    belongs_to :category

    validates :price, numericality: true, presence: true, on: {:create, :update}
    validates :dish_name, :description, presence: true, format: {with: /\A[a-zA-Z0-9]+\z/, message: "Only alphanumeric characters are allowed"}, on: [:create, :update]
    validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true, on: :create
end
