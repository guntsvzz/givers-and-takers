class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :interest, foreign_key: "giver_id"
  has_many :requests, foreign_key: "taker_id"

  enum role: { admin: 0, giver: 1, taker: 2 }
  enum organization_type: { non_profit: 0, educational: 1, other: 2, corporate: 3, government: 4 }
  
  # validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  # validates :address, presence: true, length: { minimum: 10 }
  validates :role, presence: true
  validates :organization_type, presence: true

end
