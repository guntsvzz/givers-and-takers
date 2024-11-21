class Request < ApplicationRecord
    belongs_to :taker, class_name: 'User', foreign_key: 'taker_id'
    # belongs_to :user
    has_one_attached :image
    has_many :interests
    

    enum status: { open: 0, fulfilment: 1, cancel: 2 }
    enum category: {
        clothing: 'clothing',
        electronics: 'electronics',
        furniture: 'furniture',
        food: 'food',
        toys: 'toys',
        books: 'books',
        household_items: 'household_items',
        personal_care: 'personal_care',
        medical_supplies: 'medical_supplies',
        miscellaneous: 'miscellaneous',
        others: 'others'
    }

    # Optional: Validations, associations, etc.
    validates :category, inclusion: { in: categories.keys }
    validates :item_name, :quantity, :description, presence: true
    validates :start_time, :end_time, presence: true
    validates :image_url, presence: true, allow_blank: true
    validates :address, presence: true # Optional, depending on requirements
    # Define a method to count completed interests (assuming there's a `completed` attribute or logic)
    def completed_interests_count
        interests.where(status: 'complete').count # Adjust the condition to match your 'completed' criteria
    end

    # Human-readable category names for display in views
    def humanized_category
        category.humanize
    end
end
  