# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :edit_permission, only: %i[edit update destroy]

  def index
    @reports = Report.order(:id)
  end

  def show
    @comments = @report.comments.preload(:user)
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = current_user.reports.build(report_params)
    @report.save
    flash[:notice] = '日報を作成しました!'
    redirect_to @report
  end

  def update
    @report.update(report_params)
    flash[:notice] = '日報を更新しました!'
    redirect_to @report
  end

  def destroy
    @report.destroy
    redirect_to reports_url
  end

  private

  def set_report
    @report = Report.find(params[:id])
    @user = User.find(@report.user_id)
  end

  def report_params
    params.require(:report).permit(:title, :context, :created_at)
  end

  def edit_permission
    @report.user == @user
  end

end
