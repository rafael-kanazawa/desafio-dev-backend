class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, format: {with: /\A[A-Za-z]+\z/, message: "Only letters are allowed"}, on: [:create, :update]
  validates :role, inclusion: { in: ["manager", "clerk", "cooker"]}, presence: true, on: [:create, :update]
end
