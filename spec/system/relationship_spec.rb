require 'rails_helper'

RSpec.describe '教育担当追加機能', type: :system do
  describe '教育対象者追加機能' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:second_user) }
    let!(:profile1) { FactoryBot.create(:profile, user: user1) }
    let!(:profile2) { FactoryBot.create(:second_profile, user: user2) }
    context 'ユーザーがマイページで教育対象者を選択した場合' do
      it '教育対象者を追加できる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'userspec@example.com'
        fill_in 'user[password]', with: '111111'
        find('#login-submit').click
        click_on 'マイページ'
        select '下田竜也', from: 'subordinate_id'
        click_on '追加する'
        expect(page).to have_content '下田竜也'
      end
    end
  end
end