class User < ApplicationRecord
  has_secure_password
  has_many :sessions,   dependent: :destroy
  has_many :plants,     dependent: :destroy
  has_many :categories, dependent: :destroy

  after_create :add_default_categories

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :email_address, presence: true, length: { minimum: 8, maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  private
    def add_default_categories
      default_categories = Category.where(user_id: nil)
      default_categories.each do |category|
        self.categories.create(name: category.name)
      end
    end
end
