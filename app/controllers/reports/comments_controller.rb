# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  private

  def set_resource
    @resource = Report.find(params[:report_id])
  end
end
