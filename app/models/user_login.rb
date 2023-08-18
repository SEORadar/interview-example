class UserLogin < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :login_at

  scope :ordered, -> { order(login_at: :desc) }
end
