class Person < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 100 }
  validates :phone_number, length: { maximum: 20 }, allow_blank: true
  validates :email, length: { maximum: 100 }, allow_blank: true
  validates :organization, length: { maximum: 100 }, allow_blank: true
  validates :url, length: { maximum: 255 }, allow_blank: true
end
