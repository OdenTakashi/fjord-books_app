# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to report_url(@report)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to report_url(Report.find(params[:report_id]))
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :created_at)
  end
end
