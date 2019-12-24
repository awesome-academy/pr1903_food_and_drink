class Rating < ApplicationRecord
  belongs_to :consumable
  belongs_to :user
  validates :rating, :inclusion => 1..5

  scope :of_consumable, ->(consumable) { where(consumable_id: consumable.id) }

  class << self
    def calculate_average_rating(ratings)
      (ratings.inject(0) { |sum, n| sum + n } / ratings.count).round(1)
    end
  end
end
