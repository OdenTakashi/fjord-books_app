# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to book_url(@book)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to book_url(Book.find(params[:book_id]))
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :created_at)
  end
end
