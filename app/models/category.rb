
class Category < ApplicationRecord
  validates_presence_of :name, :slug
  validates_uniqueness_of :slug

  has_many :product_categories
  has_many :products, through: :product_categories
end
