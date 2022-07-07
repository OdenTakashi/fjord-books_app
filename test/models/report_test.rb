# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'created_on' do
    report = reports(:today_lunch)
    report_created_at = "2022-07-07 14:52".in_time_zone
    assert_equal "2022-07-07".to_date, report.created_on
  end

  test 'editable?' do
    me = User.create!(name: 'Dave', email: 'dave@example.com', password: 'password')
    you = User.create!(name: 'Bieber', email: 'bieber@example.com', password: 'password')
    report = me.reports.create!(title: 'dinner', content: 'carry')
    assert report.editable?(me)
    assert_not report.editable?(you)
  end
end
