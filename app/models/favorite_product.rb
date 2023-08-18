class FavoriteProduct < ApplicationRecord
  validates_presence_of :product_id, :user_id
  validates_uniqueness_of :product_id, scope: :user_id

  belongs_to :user
  belongs_to :product
end
