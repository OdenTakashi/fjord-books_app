# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name_or_email" do
    user = users(:test)
    assert_equal "test@example.com", user.name_or_email
  end

  test "follow" do
    me = users(:me)
    she = users(:she)
    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
  end

  test "unfollow" do
    me = users(:me)
    she = users(:she)
    me.follow(she)
    assert me.following?(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end

  test "following?" do
    me = users(:me)
    she = users(:she)
    me.follow(she)
    assert me.following?(she)
  end

  test "followed_by?" do
    me = users(:me)
    she = users(:she)
    me.follow(she)
    assert she.followed_by?(me)
  end

end
