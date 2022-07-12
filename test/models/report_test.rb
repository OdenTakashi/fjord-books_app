# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'created_on' do
    report = reports(:oden_report)
    report.created_at = '2022-07-07 14:52'.in_time_zone
    assert_equal '2022-07-07'.to_date, report.created_on
  end

  test 'editable?' do
    oden = users(:odentakashi)
    naoki = users(:naoki)
    report = reports(:oden_report)
    assert report.editable?(oden)
    assert_not report.editable?(naoki)
  end
end
