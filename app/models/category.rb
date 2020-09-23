class Category < ApplicationRecord
    validates :designation, presence: true, uniqueness: {case_sensitive: false}, format: { with: /^[a-zA-Z]+$/, message: "Only letters are allowed"}, on: [:create, :update]
end