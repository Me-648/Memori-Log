class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_secure_password

  has_many :diaries, dependent: :destroy # User モデルと Diary モデルの関連付け（後で戻します）

  # バリデーションを設定
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # パスワードの長さを8文字以上にする
  validates :password, length: { minimum: 8 }
end
