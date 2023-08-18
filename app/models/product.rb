
class Product < ApplicationRecord
  validates_presence_of :name, :slug, :price_usd, :image_url
  validates_uniqueness_of :slug

  has_many :product_categories
  has_many :categories, through: :product_categories

  scope :active, -> { where(is_active: true) }
end
