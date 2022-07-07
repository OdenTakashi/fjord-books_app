# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'name_or_email' do
    wakisaka = users(:wakisaka)
    naoki = users(:naoki)
    assert_equal 'wakisaka@example.com', wakisaka.name_or_email
    assert_equal 'Naoki', naoki.name_or_email
  end

  test 'follow' do
    wakisaka = users(:wakisaka)
    naoki = users(:naoki)
    assert_not wakisaka.following?(naoki)
    wakisaka.follow(naoki)
    assert wakisaka.following?(naoki)
  end

  test 'unfollow' do
    wakisaka = users(:wakisaka)
    naoki = users(:naoki)
    wakisaka.follow(naoki)
    assert wakisaka.following?(naoki)
    wakisaka.unfollow(naoki)
    assert_not wakisaka.following?(naoki)
  end

  test 'following?' do
    wakisaka = users(:wakisaka)
    naoki = users(:naoki)
    assert_not wakisaka.following?(naoki)
    wakisaka.follow(naoki)
    assert wakisaka.following?(naoki)
  end

  test 'followed_by?' do
    wakisaka = users(:wakisaka)
    naoki = users(:naoki)
    assert_not naoki.followed_by?(wakisaka)
    wakisaka.follow(naoki)
    assert naoki.followed_by?(wakisaka)
  end
end
