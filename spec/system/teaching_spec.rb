require 'rails_helper'

RSpec.describe '教育内容管理機能', type: :system do
  describe '教育内容作成機能' do
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
    context '教育内容を作成しようとした場合' do
      it '教育内容が作成できる' do
        click_on '詳細'
        sleep(2)
        click_on '作成'
        select '2021', from: 'teaching[date(1i)]'
        select '2月', from: 'teaching[date(2i)]'
        select '5', from: 'teaching[date(3i)]'
        fill_in 'teaching[educator]', with: '鈴木雅人'
        fill_in 'teaching[title]', with: '水のためかた'
        fill_in 'teaching[content]', with: '手のひらを池のようにして...'
        fill_in 'teaching[advice]', with: '手のひらを池のようにして...'
        fill_in 'teaching[remarks]', with: '次回シャンプーしてあげてください'
        click_on '作成'
        expect(page).to have_content '教育内容を作成しました'
      end
    end
  end
  describe '教育内容編集機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    let!(:division) { FactoryBot.create(:division) }
    let!(:education) { FactoryBot.create(:education, user: user2, division: division) }
    let!(:status) { FactoryBot.create(:status, education: education) }
    let!(:subject) { FactoryBot.create(:subject, user: user2, education: education) }
    let!(:teaching) { FactoryBot.create(:teaching, user: user2, subject: subject) }
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
    context '教育内容を編集しようとした場合' do
      it '教育内容が編集できる' do
        click_on '詳細'
        sleep(2)
        click_on '編集'
        select '2021', from: 'teaching[date(1i)]'
        select '2月', from: 'teaching[date(2i)]'
        select '5', from: 'teaching[date(3i)]'
        fill_in 'teaching[educator]', with: '鈴木雅人'
        fill_in 'teaching[title]', with: '水のためかた'
        fill_in 'teaching[content]', with: '手のひらを池のようにして...'
        fill_in 'teaching[advice]', with: '手のひらを池のようにして...'
        fill_in 'teaching[remarks]', with: '次回シャンプーしてあげてください'
        click_on '更新'
        expect(page).to have_content '教育内容を編集しました'
      end
    end
  end
  describe '教育内容削除機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    let!(:division) { FactoryBot.create(:division) }
    let!(:education) { FactoryBot.create(:education, user: user2, division: division) }
    let!(:status) { FactoryBot.create(:status, education: education) }
    let!(:subject) { FactoryBot.create(:subject, user: user2, education: education) }
    let!(:teaching) { FactoryBot.create(:teaching, user: user2, subject: subject) }
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
    context '教育内容を削除しようとした場合' do
      it '教育内容が削除できる' do
        click_on '詳細'
        sleep(2)
        page.accept_alert do
          click_on '削除'
        end
        expect(page).to have_content '教育内容を削除しました'
      end
    end
  end
end