require 'rails_helper'

RSpec.describe '教育ページ管理機能', type: :system do
  describe '教育ぺージ作成機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    let!(:division) { FactoryBot.create(:division) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'userspec@example.com'
      fill_in 'user[password]', with: '111111'
      find('#login-submit').click
      click_on 'マイページ'
      select '下田竜也', from: 'subordinate_id'
      click_on '追加する'
      visit profiles_path
    end
    context '教育ページを作成しようとした場合' do
      it '教育ページが作成できる' do
        page.all("#education-path")[1].click
        visit new_education_path(user_id: user2.id, division_id: division.id)
        fill_in 'education[name]', with: '技術'
        fill_in 'education[status_attributes][purpose]', with: 'お客様の信頼を得るために技術を磨こう！'
        select '2020', from: 'education[status_attributes][created_date(1i)]'
        select '2月', from: 'education[status_attributes][created_date(2i)]'
        select '1', from: 'education[status_attributes][created_date(3i)]'
        select '2022', from: 'education[status_attributes][education_period(1i)]'
        select '2月', from: 'education[status_attributes][education_period(2i)]'
        select '1', from: 'education[status_attributes][education_period(3i)]'
        fill_in 'education[status_attributes][remarks]', with: 'ワインディング関東大会２位'
        click_on '作成'
        expect(page).to have_content '教育ページを作成しました'
      end
    end
  end
  describe '教育ぺージ編集機能' do
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
    end
    context '教育ページを編集しようとした場合' do
      it '教育ページが編集できる' do
        page.all("#education-path")[1].click
        click_on '編集'
        sleep(5)
        fill_in 'education[name]', with: '接客'
        fill_in 'education[status_attributes][purpose]', with: 'お客様の信頼を得るために技術を磨こう！'
        select '2020', from: 'education[status_attributes][created_date(1i)]'
        select '2月', from: 'education[status_attributes][created_date(2i)]'
        select '1', from: 'education[status_attributes][created_date(3i)]'
        select '2022', from: 'education[status_attributes][education_period(1i)]'
        select '2月', from: 'education[status_attributes][education_period(2i)]'
        select '1', from: 'education[status_attributes][education_period(3i)]'
        fill_in 'education[status_attributes][remarks]', with: 'ワインディング関東大会２位'
        click_on '更新'
        expect(page).to have_content '接客'
      end
    end
  end
  describe '教育ぺージ削除機能' do
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
    end
    context '教育ページを削除しようとした場合' do
      it '教育ページが削除できる' do
        page.all("#education-path")[1].click
        page.accept_alert do
          click_on '削除'
        end
        expect(page).to have_content '教育ページを削除しました'
      end
    end
  end
end