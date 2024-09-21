class CustomField < ApplicationRecord
  self.primary_key = 'custom_field_id'

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :entity, polymorphic: true, foreign_key: 'entity_id'

  validates :entity_type, presence: true, inclusion: { in: %w[Person Event Place] }
  validates :entity_id, presence: true
  validates :field_name, presence: true, length: { maximum: 100 }
  validates :field_value, presence: true, length: { maximum: 1000 }
end
