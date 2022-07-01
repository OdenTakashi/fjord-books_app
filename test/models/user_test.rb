# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name_or_email" do
    user_test1 = users(:wakisaka)
    user_test2 = users(:naoki)
    assert_equal "wakisaka@example.com", user_test1.name_or_email
    assert_equal "Naoki", user_test2.name_or_email
  end

  test "follow" do
    me = users(:wakisaka)
    he = users(:naoki)
    assert_not me.following?(he)
    me.follow(he)
    assert me.following?(he)
  end

  test "unfollow" do
    me = users(:wakisaka)
    he = users(:naoki)
    me.follow(he)
    assert me.following?(he)
    me.unfollow(he)
    assert_not me.following?(he)
  end

  test "following?" do
    me = users(:wakisaka)
    he = users(:naoki)
    me.follow(he)
    assert me.following?(he)
  end

  test "followed_by?" do
    me = users(:wakisaka)
    he = users(:naoki)
    me.follow(he)
    assert he.followed_by?(me)
  end

end
