class Event < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 100 }
  validates :url, length: { maximum: 255 }, allow_blank: true
end
