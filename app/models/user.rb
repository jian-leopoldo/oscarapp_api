class User < ApplicationRecord
  before_create :generate_token
  validate :same_email

  private 

  def same_email
    user = User.find_by(email: email)
    errors.add(:email, "Email já está sendo usado!") if user.present?
  end

  def generate_token
    self.token = rand(0..100)
  end
end
