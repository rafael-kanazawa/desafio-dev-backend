class Category < ApplicationRecord
    validates :designation, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters are allowed"}, on: [:create, :update]
end