class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Use before_validation instead of after_initialize
  before_validation :set_defaults, on: :create

  # Set a default value for new records
  # after_initialize :set_defaults, if: :new_record?

  # has_many :interests, foreign_key: "giver_id"
  has_many :interests, foreign_key: "user_id"
  has_many :requests, foreign_key: "taker_id"
  has_many :donations

  has_one_attached :profile_image
  
  # Define roles using enum
  enum role: { admin: 0, giver: 1, taker: 2 }
  enum organization_type: { non_profit: 0, educational: 1, other: 2, corporate: 3, government: 4 }
  enum status: { default: 0, verified: 1, non_verified: 2 }

  # Validations
  # validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  # validates :address, presence: true, length: { minimum: 10 }
  # validates :role, presence: true
  # validates :organization_type, presence: true
  validates :role, presence: true, inclusion: { in: roles.keys }
  validates :organization_type, presence: true, inclusion: { in: organization_types.keys }
  validates :status, presence: true, inclusion: { in: statuses.keys }
  # validates :profile_image,
  #         content_type: ['image/png', 'image/jpg', 'image/jpeg'],
  #         size: { less_than: 20.megabytes, message: 'is too large. Max size is 20 MB' }
  validate :validate_profile_image

  def image_url
    # Use a default image if no specific URL is set
    'assets/organizer-avatar.png'
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end
  
  # Define possible statuses
  STATUSES = {
    default: 'default',
    verified: 'verified',
    non_verified: 'non_verified'
  }.freeze

  def set_defaults
    self.status = :default if self.status.blank?
    self.role = :giver if self.role.blank?
    self.organization_type = :non_profit if self.organization_type.blank?
  end

  # Calculate the total quantity of items a user has shown interest in
  def total_interested_quantity
    interests.where(status: 1).sum(:quantity) || 0
  end

  def validate_profile_image
    return unless profile_image.attached? # Skip validation if no image is attached
  
    # Check content type
    acceptable_types = ["image/png", "image/jpg", "image/jpeg"]
    unless acceptable_types.include?(profile_image.blob.content_type)
      errors.add(:profile_image, "must be a PNG, JPG, or JPEG")
    end
  
    # Check file size
    if profile_image.blob.byte_size > 20.megabytes
      errors.add(:profile_image, "is too large. Max size is 20 MB")
    end
  end  
end
