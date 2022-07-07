# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:korean_training)

    visit root_url

    fill_in 'Eメール', with: 'odentakashidesu@example.com'
    fill_in 'パスワード', with: 'Bokunaoki'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url

    assert_selector 'h1', text: '本'
    assert_text 'ゼロからしっかり学べる韓国語'
    assert_text 'ためになるよ'
  end

  test 'creating a Book' do
    visit books_url

    click_on '新規作成'

    fill_in 'タイトル', with: 'クドリャフカの順番'
    fill_in 'メモ', with: 'おすすめ！'
    click_on '登録する'

    assert_text '本が作成されました'
    assert_text 'クドリャフカの順番'
    assert_text 'おすすめ！'
  end

  test 'updating a Book' do
    visit books_url

    assert_text 'ゼロからしっかり学べる韓国語'
    assert_text 'ためになるよ'

    click_on '編集'

    fill_in 'タイトル', with: '遠回りする雛'
    fill_in 'メモ', with: 'めっちゃ面白いよ'
    click_on '更新'

    assert_text '本が更新されました。'
    assert_text '遠回りする雛'
    assert_text 'めっちゃ面白いよ'
  end

  test 'destroying a Book' do
    visit books_url

    assert_text 'ゼロからしっかり学べる韓国語'
    assert_text 'ためになるよ'

    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_not page.has_content?('ゼロからしっかり学べる韓国語')
    assert_not page.has_content?('ためになるよ')
  end
end
