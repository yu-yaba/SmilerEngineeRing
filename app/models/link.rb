class Link < ApplicationRecord
  self.primary_key = 'link_id'

  belongs_to :user, foreign_key: 'user_id'

  belongs_to :from_node, polymorphic: true
  belongs_to :to_node, polymorphic: true

  validates :color, presence: true, length: { maximum: 20 }

  # リンクは少なくとも一つのエンティティを参照する必要がある
  validate :must_have_from_and_to_nodes

  private

  def must_have_from_and_to_nodes
    if from_node_type.blank? || from_node_id.blank? || to_node_type.blank? || to_node_id.blank?
      errors.add(:base, 'Link must have both from and to nodes')
    end
  end
end
