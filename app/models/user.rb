class User < ApplicationRecord
  validates :email, presence: true,uniqueness: true
  validates :password, presence: true, length: {minimum: 5}
  validates :rpassword, presence: true, length: {minimum: 5}

  def posts
  	return Post.where(user_id: self.id)
  end
end
