class Plant < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { maximum: 25 }

  validate :must_have_at_least_one_category

  private

  def must_have_at_least_one_category
    if category_ids.empty?
      errors.add(:base, "Each plant must belong to at least one category")
    end
  end
end
