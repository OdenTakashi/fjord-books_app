# frozen_string_literal: true

class CommentsController < ApplicationController
	before_action :set_resource

  def create
    @comment = @resource.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @resource
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @resource
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :created_at)
  end

	def set_resource
		raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
	end

end
