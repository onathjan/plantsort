class Category < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  has_and_belongs_to_many :plants

  validates :name, presence: true
end
