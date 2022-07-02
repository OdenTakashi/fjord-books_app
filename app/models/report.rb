# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  def edit_permission(login_user)
    user_id == login_user.id
  end
end
