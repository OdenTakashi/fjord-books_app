# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "created_on" do 
  user = User.create!(name: "sample", email: "sample@example.com", password: "password")
    travel_to Time.zone.local(2022, 6,29) do 
      report = user.reports.create!(title: "test", content: "sample")
      assert_equal Date.today, report.created_on
    end
  end

  test "editable?" do
    me = User.create!(name: "sample", email: "samp@example.com", password: "password")
    you = User.create!(name: "sample", email: "sampl@example.com", password: "password")
    report = me.reports.create!(title: "test", content: "sample")
    assert report.editable?(me)
    assert_not report.editable?(you)
  end
end
