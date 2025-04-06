class User < ApplicationRecord
  has_secure_password

  # バリデーションを設定
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # パスワードの長さを8文字以上にする
  validates :password, length: { minimum: 8 } 
end
