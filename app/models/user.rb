class User < ApplicationRecord
  has_many :posts
  has_many :comments

  # validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 6..20 }

  validate :name_validator

  def name_validator
    
    unless username.length.between?(5, 20)
      errors.add(:username, 'must be between 5 and 20 characters')
    end
  end
end
