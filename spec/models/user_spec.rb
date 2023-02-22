require 'rails_helper'

RSpec.describe User, type: :model do
  it "メールアドレスとパスワードがあれば有効な状態であること" do
    user = User.new(
      email: 'userspec@example.com',
      password: '111111'
    )
    expect(user).to be_valid
  end
  it "メールアドレスが空欄なら無効な状態であること" do
    user = User.new(
      email: '',
      password: '111111'
    )
    expect(user).not_to be_valid
  end
  it "メールアドレスが255文字以上入力されると無効な状態であること" do
    user = User.new(
      email: 'a' * 256 + '@example.com',
      password: '111111'
    )
    expect(user).not_to be_valid
  end
  it "メールアドレスのフォーマットが指定した以外のものだと無効な状態であること" do
    user = User.new(
      email: 'userspecexample.com',
      password: '111111'
    )
    expect(user).not_to be_valid
  end
  it "重複したメールアドレスなら無効な状態であること" do
    User.create(
      email: 'userspec@example.com',
      password: '111111'
    )
    user = User.new(
      email: 'userspec@example.com',
      password: '111111'
    )
    expect(user).not_to be_valid
  end
end