# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'created_on' do
    user = User.create!(name: 'Mike', email: 'mike@example.com', password: 'password')
    travel_to Time.zone.local(2022, 6, 29) do
      report = user.reports.create!(title: 'lunch', content: 'yakiniku')
      assert_equal Time.zone.today, report.created_on
    end
  end

  test 'editable?' do
    me = User.create!(name: 'Dave', email: 'dave@example.com', password: 'password')
    you = User.create!(name: 'Bieber', email: 'bieber@example.com', password: 'password')
    report = me.reports.create!(title: 'dinner', content: 'carry')
    assert report.editable?(me)
    assert_not report.editable?(you)
  end
end
