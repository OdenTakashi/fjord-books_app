# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:today_lunch)

    visit root_url
    fill_in 'Eメール', with: 'odentakashidesu@icloud.com'
    fill_in 'パスワード', with: 'Bokunaoki'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
		assert_text @report.title
		assert_text @report.user.email
		assert_text @report.created_at.strftime('%Y/%m/%d')
		assert_text '詳細'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '今日の天気'
    fill_in '内容', with: '猛暑だったよ〜'
    click_on '登録する'

    assert_text '日報が作成されました'
    assert_text '今日の天気'
		assert_text '猛暑だったよ〜'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: '今日の自分'
    fill_in '内容', with: 'いい感じだったよ'
    click_on '更新'

    assert_text '日報が更新されました。'
    assert_text '今日の自分'
		assert_text 'いい感じだったよ'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
		assert_nil Report.find_by(id: @report)
  end
end
