# class Interest < ApplicationRecord
#   belongs_to :request
#   belongs_to :user
#   # belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'

#   after_initialize :set_default_status, if: :new_record?
  
#   enum delivery_method: { 'in_person' => 0, 'shipping' => 1, 'other' => 2 }
#   # Validations can be added for quantity and delivery_method
#   validates :quantity, presence: true
#   validates :delivery_method, presence: true

#   private

#   def set_default_status
#     self.status ||= 0
#   end
# end

class Interest < ApplicationRecord
  belongs_to :request
  belongs_to :user

  after_initialize :set_default_status, if: :new_record?

  enum delivery_method: { in_person: 0, shipping: 1, other: 2 }

  validates :quantity, presence: true
  validates :delivery_method, presence: true

  private

  def set_default_status
    self.status ||= 0
  end
end
