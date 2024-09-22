class User < ApplicationRecord
  extend Devise::Models
  # Devise モジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  self.primary_key = 'user_id'

  has_many :people, foreign_key: 'user_id', dependent: :destroy
  has_many :events, foreign_key: 'user_id', dependent: :destroy
  has_many :places, foreign_key: 'user_id', dependent: :destroy
  has_many :custom_fields, foreign_key: 'user_id', dependent: :destroy
  has_many :links, foreign_key: 'user_id', dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
end
