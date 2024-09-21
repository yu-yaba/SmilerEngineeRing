class User < ApplicationRecord
  extend Devise::Models
  # Devise モジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :people, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :custom_fields, dependent: :destroy
  has_many :links, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
end
