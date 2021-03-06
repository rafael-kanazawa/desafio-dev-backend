class Table < ApplicationRecord
    validates :number, numericality: {only_integer: true}, uniqueness: true, presence: true, on: [:create, :update]
end