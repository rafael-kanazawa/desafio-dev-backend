class Bill < ApplicationRecord
    has_many :orders, dependent: :destroy
    belongs_to :table


end
