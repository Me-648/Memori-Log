class Diary < ApplicationRecord
  belongs_to :user

  # Active Storageで画像を1枚添付
  has_one_attached :image
end
