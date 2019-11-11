class Suggestion < ApplicationRecord
  include Discard::Model

  belongs_to :user

  validates :name, presence: true, 
                   length: {minimum: 1, maximum: 100}
  validates :picture, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
