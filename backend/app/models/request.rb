class Request < ApplicationRecord
    # belongs_to :taker, class_name: "User", foreign_key: "taker_id"
    belongs_to :user
    has_one_attached :image
    has_many :interests
    

    enum status: { open: 0, fulfilment: 1, cancel: 2 }

    validates :item_name, :quantity, :description, presence: true
    validates :start_time, :end_time, presence: true
    
end
  