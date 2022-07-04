# frozen_string_literal: true

class Books::CommentsController < CommentsController
  private

  def set_resource
    @resource = Book.find(params[:book_id])
  end
end
