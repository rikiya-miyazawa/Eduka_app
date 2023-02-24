RSpec.describe Teaching, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:division) { FactoryBot.create(:division) }
  let!(:education) { FactoryBot.create(:education, user: user, division: division) }
  let!(:subject) { FactoryBot.create(:subject, user: user, education: education) }
  let!(:teaching) { FactoryBot.create(:teaching, user: user, subject: subject) }

  describe 'Teachingのバリデーションのテスト' do
    context '教育者名,タイトル,内容の入力がある場合' do
      it "教育内容の登録ができる" do
        expect(teaching).to be_valid
      end
    end
    context '教育者名の入力がない場合' do
      it "教育内容の登録ができない" do
        teaching = Teaching.new(
          date: '2023-2-23',
          educator: '',
          title: 'シャンプーの手順について',
          content: 'まずはクロスをつけてから...',
          advice: '水が跳ねないように気をつけよう！',
          remarks: '次回はマッサージも教えてあげてください。',
          user: user,
          subject: subject
        )
        expect(teaching).not_to be_valid
      end
    end
    context '教育者名が100文字以上入力された場合' do
      it "教育内容の登録ができない" do
        teaching = Teaching.new(
          date: '2023-2-23',
          educator: 'a' * 101,
          title: 'シャンプーの手順について',
          content: 'まずはクロスをつけてから...',
          advice: '水が跳ねないように気をつけよう！',
          remarks: '次回はマッサージも教えてあげてください。',
          user: user,
          subject: subject
        )
        expect(teaching).not_to be_valid
      end
    end
    context 'タイトルの入力がない場合' do
      it "教育内容の登録ができない" do
        teaching = Teaching.new(
          date: '2023-2-23',
          educator: '鈴木雅人',
          title: '',
          content: 'まずはクロスをつけてから...',
          advice: '水が跳ねないように気をつけよう！',
          remarks: '次回はマッサージも教えてあげてください。',
          user: user,
          subject: subject
        )
        expect(teaching).not_to be_valid
      end
    end
    context 'タイトルが150文字以上入力された場合' do
      it "教育内容の登録ができない" do
        teaching = Teaching.new(
          date: '2023-2-23',
          educator: '鈴木雅人',
          title: 'a' * 151,
          content: 'まずはクロスをつけてから...',
          advice: '水が跳ねないように気をつけよう！',
          remarks: '次回はマッサージも教えてあげてください。',
          user: user,
          subject: subject
        )
        expect(teaching).not_to be_valid
      end
    end
    context '内容の入力がない場合' do
      it "教育内容の登録ができない" do
        teaching = Teaching.new(
          date: '2023-2-23',
          educator: '鈴木雅人',
          title: 'シャンプーの手順について',
          content: '',
          advice: '水が跳ねないように気をつけよう！',
          remarks: '次回はマッサージも教えてあげてください。',
          user: user,
          subject: subject
        )
        expect(teaching).not_to be_valid
      end
    end
    context '内容が5000文字以上入力された場合' do
      it "教育内容の登録ができない" do
        teaching = Teaching.new(
          date: '2023-2-23',
          educator: '鈴木雅人',
          title: 'シャンプーの手順について',
          content: 'a' * 5001,
          advice: '水が跳ねないように気をつけよう！',
          remarks: '次回はマッサージも教えてあげてください。',
          user: user,
          subject: subject
        )
        expect(teaching).not_to be_valid
      end
    end
    context 'アドバイスが5000文字以上入力された場合' do
      it "教育内容の登録ができない" do
        teaching = Teaching.new(
          date: '2023-2-23',
          educator: '鈴木雅人',
          title: 'シャンプーの手順について',
          content: 'まずはクロスをつけてから...',
          advice: 'a' * 5001,
          remarks: '次回はマッサージも教えてあげてください。',
          user: user,
          subject: subject
        )
        expect(teaching).not_to be_valid
      end
    end
    context '備考が5000文字以上入力された場合' do
      it "教育内容の登録ができない" do
        teaching = Teaching.new(
          date: '2023-2-23',
          educator: '鈴木雅人',
          title: 'シャンプーの手順について',
          content: 'まずはクロスをつけてから...',
          advice: '次回はマッサージも教えてあげてください。',
          remarks: 'a' * 5001,
          user: user,
          subject: subject
        )
        expect(teaching).not_to be_valid
      end
    end
  end
end