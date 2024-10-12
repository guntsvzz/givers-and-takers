class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  enum role: { giver: 0, taker: 1, admin: 2 }
  # Secure password handling
  has_secure_password
  
  # Validations (optional, but recommended)
  validates :first_name, :last_name, :email, :username, :citizen_id, :organization_name, :organization_type, :role, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
end
