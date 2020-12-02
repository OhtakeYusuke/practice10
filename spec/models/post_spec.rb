require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーション" do
    subject { post.valid? }
    let(:user) {build(:user)}
      context "データが条件を満たすとき" do
        let(:post) {build(:post, user: user)}
        it "保存できる" do
          expect(subject).to eq true
        end
      end
      context "name が空のとき" do
        let(:post) {build(:post, title: "", user: user)}
        it "エラーが発生する" do
          expect(subject).to eq false
        end
      end
      context "name が31文字以上のとき" do
        let(:post) {build(:post, title: "a" * 31, user: user)}
        it "エラーが発生する" do
          expect(subject).to eq false
        end
      end
      context "description が空のとき" do
        let(:post) {build(:post, description: "", user: user)}
        it "エラーが発生する" do
          expect(subject).to eq false
        end
      end
      context "description が141文字以上のとき" do
        let(:post) {build(:post, description: "a" * 141, user: user)}
        it "エラーが発生する" do
          expect(subject).to eq false
        end
      end
  end

  context "ユーザーが削除されたとき" do
    subject {user.destroy}

    let(:user) {create(:user)}
    before do
      create_list(:post, 2, user: user)
      create(:post)
    end
    it "そのユーザーのメッセージも削除される" do
      expect{subject}.to change {user.posts.count}.by(-2)
    end
  end
end
