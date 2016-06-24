class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :playlists, through: :songs
  LETTERS_ONLY_REGEX = /\A^[A-Za-z]+$\z/
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :password, presence: true
  validates :first_name, :last_name, uniqueness: { case_sensitive: false }, format: { with: LETTERS_ONLY_REGEX }, length: { in: 2..50 }
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, length: { in: 8..40 }
  validates :password, length: { in: 8..20 }
  validates_confirmation_of :password

  before_save do
    self.first_name.capitalize!
    self.last_name.capitalize!
    self.email.downcase!
  end
end
