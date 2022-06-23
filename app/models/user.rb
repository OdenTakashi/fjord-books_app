# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_friendships, class_name: 'Friendship',
                                foreign_key: 'follower_id',
                                inverse_of: 'follower',
                                dependent: :destroy
  has_many :followings, through: :active_friendships, source: :followed
  has_many :passive_friendships, class_name: 'Friendship',
                                 foreign_key: 'followed_id',
                                 inverse_of: 'followed',
                                 dependent: :destroy
  has_many :followers, through: :passive_friendships, source: :follower

  def follow(other_user)
    followings << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_friendships.find_by!(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    followings.include?(other_user)
  end
end
