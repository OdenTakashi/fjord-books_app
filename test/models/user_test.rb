# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'name_or_email' do
    user_wakisaka = users(:wakisaka)
    user_naoki = users(:naoki)
    assert_equal 'wakisaka@example.com', user_wakisaka.name_or_email
    assert_equal 'Naoki', user_naoki.name_or_email
  end

  test 'follow' do
    user_wakisaka = users(:wakisaka)
    user_naoki = users(:naoki)
    assert_not user_wakisaka.following?(user_naoki)
    user_wakisaka.follow(user_naoki)
    assert user_wakisaka.following?(user_naoki)
  end

  test 'unfollow' do
    user_wakisaka = users(:wakisaka)
    user_naoki = users(:naoki)
    user_wakisaka.follow(user_naoki)
    assert user_wakisaka.following?(user_naoki)
    user_wakisaka.unfollow(user_naoki)
    assert_not user_wakisaka.following?(user_naoki)
  end

  test 'following?' do
    user_wakisaka = users(:wakisaka)
    user_naoki = users(:naoki)
    user_wakisaka.follow(user_naoki)
    assert user_wakisaka.following?(user_naoki)
  end

  test 'followed_by?' do
    user_wakisaka = users(:wakisaka)
    user_naoki = users(:naoki)
    user_wakisaka.follow(user_naoki)
    assert user_naoki.followed_by?(user_wakisaka)
  end
end
