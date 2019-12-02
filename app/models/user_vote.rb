class UserVote < ApplicationRecord
  validate :same_user


  private 

  def same_user
    us = UserVote.where(user_id: user_id)
    errors.add(:user_id, "Usuário ja votou um vez!") if us.present?
  end
end
