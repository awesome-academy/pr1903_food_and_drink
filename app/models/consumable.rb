class Consumable < ActiveRecord::Base
  scope :not_discarded, -> { where(discarded_at: nil)}

  has_many :cart_items
  has_many :category_consumables, dependent: :delete_all
  has_many :categories, through: :category_consumables, dependent: :delete_all
  has_many :ratings

  validates :name, presence: true,
                   length: {minimum: 1, maximum: 100}
  # validates :picture, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  scope :by_name, -> (keyword) {where('name LIKE ?', "%#{keyword}%")}
  # default_scope { where(active: true)}

  mount_uploader :pictures, PictureUploader
end

