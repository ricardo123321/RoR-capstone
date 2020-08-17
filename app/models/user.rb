class User < ApplicationRecord
  has_one_attached :avatar
  has_many :hours
  before_save :create_remember_token
  validates :name, presence: true
  validates :avatar, presence: true
  
  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
end
