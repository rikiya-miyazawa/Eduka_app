require 'rails_helper'

RSpec.describe '検索機能', type: :system do
  describe '検索機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'userspec@example.com'
      fill_in 'user[password]', with: '111111'
      find('#login-submit').click
    end
    context 'ユーザー名で検索した場合' do
      it '対象のユーザのみ表示される' do
        fill_in 'q[name_or_job_cont]', with: '下田竜也'
        click_on '検索'
        expect(page).to have_content '下田竜也'
      end
    end
    context '職種名で検索した場合' do
      it '対象のユーザのみ表示される' do
        fill_in 'q[name_or_job_cont]', with: 'スタイリスト'
        click_on '検索'
        expect(page).to have_content '田中舞'
      end
    end
  end
end