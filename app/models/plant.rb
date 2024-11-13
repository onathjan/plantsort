class Plant < ApplicationRecord
  has_and_belongs_to_many :categories

  validates :common_name, presence: true
end
