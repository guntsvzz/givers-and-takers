class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Set a default value for new records
  after_initialize :set_defaults, if: :new_record?

  # has_many :interests, foreign_key: "giver_id"
  has_many :interests, foreign_key: "user_id"
  has_many :requests, foreign_key: "taker_id"
  has_many :donations

  # Define roles using enum
  enum role: { admin: 0, giver: 1, taker: 2 }
  enum organization_type: { non_profit: 0, educational: 1, other: 2, corporate: 3, government: 4 }
  enum status: { default: 0, verified: 1, non_verified: 2 }  # Replaced STATUSES constant with enum
  
  # Validations
  # validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  # validates :address, presence: true, length: { minimum: 10 }
  validates :role, presence: true
  validates :organization_type, presence: true

  def image_url
    # Use a default image if no specific URL is set
    'assets/organizer-avatar.png'
  end

  # Define possible statuses
  STATUSES = {
    default: 'default',
    verified: 'verified',
    non_verified: 'non-verified'
  }.freeze

  def set_defaults
    self.status ||= :default
    self.role ||= :giver
    self.organization_type ||= :non_profit
  end

  # Calculate the total quantity of items a user has shown interest in
  def total_interested_quantity
    interests.sum(:quantity) || 0
  end
end
