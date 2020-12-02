require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーション" do
    subject{ user.valid? }
    context "条件を満たす" do
      let(:user) {create(:user)}
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "名前が空欄" do
      let(:user) {build(:user, name: "")}
      it "エラー発生" do
        expect(subject).to eq false
      end
    end
    context "名前が２０文字を超える" do
      let(:user) {build(:user, name: "a" * 21)}
      it "エラー発生" do
        expect(subject).to eq false
      end
    end
    context "メールアドレスが空" do
      let(:user) {build(:user, email: "")}
      it "エラー発生" do
        expect(subject).to eq false
      end
    end
    context "メールアドレスが同じ" do
      before do
        create(:user, email: "test@test")
      end
      let(:user) {build(:user, email: "test@test")}
      it "エラー発生" do
        expect(subject).to eq false
      end
    end
    context "年齢がマイナス" do
      let(:user) {build(:user, age: -1)}
      it "エラー発生" do
        expect(subject).to eq false
      end
    end
    context "年齢が数字ではない" do
      let(:user) {build(:user, age: "aaa")}
      it "エラー発生" do
        expect(subject).to eq false
      end
    end
    context "パスワードが空" do
      let(:user) {build(:user, password: "")}
      it "" do
        expect(subject).to eq false
      end
    end
  end
end
