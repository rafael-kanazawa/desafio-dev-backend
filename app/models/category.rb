class Category < ApplicationRecord
    validates :designation, presence: true, uniqueness: true
end