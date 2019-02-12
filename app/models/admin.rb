# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Admin < ApplicationRecord
  before_validation :ensure_session_token
  validates :username, :password_digest, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  has_one_attached :profile_pic
  has_many :pages,
  foreign_key: :author_id

  def self.find_by_credentials(username, password)
    user = self.find_by_username(username)
    return user if user && user.is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
