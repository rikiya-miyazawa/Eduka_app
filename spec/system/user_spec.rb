require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  let!(:division) { FactoryBot.create(:division) }
  describe 'ユーザー登録機能' do
    context 'ユーザーが新規登録をした場合' do
      it 'アカウント登録ができ、社員一覧に遷移できる' do
        visit new_user_registration_path
        fill_in 'user[profile_attributes][name]', with: 'spectest'
        fill_in 'user[email]', with: 'spectest@example.com'
        find(:css, '#signup-division-form').select("千葉店")
        fill_in 'user[password]', with: '111111'
        fill_in 'user[password_confirmation]', with: '111111'
        click_on '登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe 'ログイン機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:role) { FactoryBot.create(:role) }
    context 'ユーザーがログインした場合' do
      it '社員一覧に遷移できる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'userspec@example.com'
        fill_in 'user[password]', with: '111111'
        find('#login-submit').click
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'ユーザーがログアウトした場合' do
      it 'メインメニューに遷移する' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'userspec@example.com'
        fill_in 'user[password]', with: '111111'
        find('#login-submit').click
        expect(page).to have_content 'ログインしました。'
        click_on 'ログアウト'
      end
    end
    context 'ゲストユーザーがログインした場合' do
      it '社員一覧に遷移できる' do
        visit menu_tops_path
        click_on 'ゲストログイン'
        expect(page).to have_content 'ゲストユーザーとしてログイン'
      end
    end
    context '管理者ゲストユーザーがログインした場合' do
      it '社員一覧に遷移できる' do
        visit menu_tops_path
        click_on '管理者ゲストログイン'
        expect(page).to have_content '管理者ゲストユーザーとしてログイン'
      end
    end
    context 'ユーザーがログインせずに社員一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移し、ログインを促す' do
        visit root_path
        visit profiles_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください'
      end
    end
  end
  describe '管理者画面機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:role) { FactoryBot.create(:role) }
    context '管理者が管理画面リンクをクリックした場合' do
      it '管理画面に遷移できる' do
        visit menu_tops_path
        click_on '管理者ゲストログイン'
        click_on '管理者画面'
        expect(page).to have_content 'サイト管理'
      end
    end
  end
  describe 'アクセス制限機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    context 'ユーザーが他のユーザのマイページにログインしようとした場合' do
      it '画面遷移できす、自分のマイページに留まる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'userspec@example.com'
        fill_in 'user[password]', with: '111111'
        find('#login-submit').click
        visit profile_path(user2.id)
        expect(page).to have_content '田中舞'
      end
    end
  end
end