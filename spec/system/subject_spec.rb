require 'rails_helper'

RSpec.describe '課題管理機能', type: :system do
  describe '課題作成機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    let!(:division) { FactoryBot.create(:division) }
    let!(:education) { FactoryBot.create(:education, user: user2, division: division) }
    let!(:status) { FactoryBot.create(:status, education: education) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'userspec@example.com'
      fill_in 'user[password]', with: '111111'
      find('#login-submit').click
      click_on 'マイページ'
      select '下田竜也', from: 'subordinate_id'
      click_on '追加する'
      visit profiles_path
      page.all("#education-path")[1].click
      click_on '詳細'
    end
    context '課題を作成しようとした場合' do
      it '課題が作成できる' do
        click_on '作成'
        fill_in 'subject[name]', with: 'シャンプー'
        select '合格', from: 'subject[status]'
        select '2023', from: 'subject[deadline(1i)]'
        select '2月', from: 'subject[deadline(2i)]'
        select '23', from: 'subject[deadline(3i)]'
        click_on '作成'
        expect(page).to have_content '課題を作成しました'
      end
    end
  end
  describe '課題編集機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    let!(:division) { FactoryBot.create(:division) }
    let!(:education) { FactoryBot.create(:education, user: user2, division: division) }
    let!(:status) { FactoryBot.create(:status, education: education) }
    let!(:subject) { FactoryBot.create(:subject, user: user2, education: education) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'userspec@example.com'
      fill_in 'user[password]', with: '111111'
      find('#login-submit').click
      click_on 'マイページ'
      select '下田竜也', from: 'subordinate_id'
      click_on '追加する'
      visit profiles_path
      page.all("#education-path")[1].click
      click_on '詳細'
      sleep(2)
    end
    context '課題を編集しようとした場合' do
      it '課題が編集できる' do
        click_on '詳細'
        click_on '編集'
        fill_in 'subject[name]', with: 'カラー'
        select '合格', from: 'subject[status]'
        select '2023', from: 'subject[deadline(1i)]'
        select '2月', from: 'subject[deadline(2i)]'
        select '23', from: 'subject[deadline(3i)]'
        click_on '更新'
        expect(page).to have_content '課題を編集しました'
      end
    end
  end
  describe '課題削除機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    let!(:division) { FactoryBot.create(:division) }
    let!(:education) { FactoryBot.create(:education, user: user2, division: division) }
    let!(:status) { FactoryBot.create(:status, education: education) }
    let!(:subject) { FactoryBot.create(:subject, user: user2, education: education) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'userspec@example.com'
      fill_in 'user[password]', with: '111111'
      find('#login-submit').click
      click_on 'マイページ'
      select '下田竜也', from: 'subordinate_id'
      click_on '追加する'
      visit profiles_path
      page.all("#education-path")[1].click
      click_on '詳細'
      sleep(2)
    end
    context '課題を削除しようとした場合' do
      it '課題が削除できる' do
        page.accept_alert do
          click_on '削除'
        end
        expect(page).to have_content '課題を削除しました'
      end
    end
  end
  describe '課題合格状況確認機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    let!(:division) { FactoryBot.create(:division) }
    let!(:education) { FactoryBot.create(:education, user: user2, division: division) }
    let!(:status) { FactoryBot.create(:status, education: education) }
    let!(:subject) { FactoryBot.create(:subject, user: user2, education: education) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'userspec@example.com'
      fill_in 'user[password]', with: '111111'
      find('#login-submit').click
      click_on 'マイページ'
      select '下田竜也', from: 'subordinate_id'
      click_on '追加する'
      visit profiles_path
      page.all("#education-path")[1].click
      click_on '詳細'
      sleep(2)
    end
    context '教育ページで' do
      it '課題の合格状況が確認できる' do
        expect(page).to have_content '未'
      end
    end
  end
end