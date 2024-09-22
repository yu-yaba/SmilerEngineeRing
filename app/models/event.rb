class Event < ApplicationRecord
  self.primary_key = 'event_id'

  belongs_to :user, foreign_key: 'user_id'
  has_many :links, foreign_key: 'event_id', dependent: :destroy
  has_one_attached :image
  has_many :custom_fields, as: :entity, foreign_key: 'entity_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :url, length: { maximum: 255 }, allow_blank: true
end
