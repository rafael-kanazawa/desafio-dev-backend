class MenuItem < ApplicationRecord
    belongs_to :category

    validates :price, numericality: true, presence: true
    validates :dish_name, :category_id, :description , presence: true
end
