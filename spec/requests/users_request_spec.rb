require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "POST #create" do
    subject{post(users_path, params: params)}
    context "パラメータが正常なとき" do
      let(:params) { {user: attributes_for(:user)} }
      it "リクエスト成功" do
        subject
        expect(response).to have_http_status(302)
      end
      it "ユーザが保存される" do
        expect{subject}.to change{User.count}.by(1)
      end
      it "一覧ページにリダイレクト" do
        subject
        expect(response).to redirect_to root_path
      end
    end
    context "パラメータが異常なとき" do
      let(:params) {{user: attributes_for(:user, name: nil)}}
      it "リクエストが成功" do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #update" do
    subject{ patch(user_path(user.id), params: params) }
    let(:user) {create(:user)}
    context "パラメータが正常なとき" do
      let(:params) {{user: attributes_for(:user)}}
      it "リクエストが成功" do
        subject
        expect(response).to have_http_status(302)
      end
      it "nameの更新" do
        origin_name = user.name
        new_name = params[:user][:name]
        expect{subject}.to change{user.reload.name}.from(origin_name).to(new_name)
      end
    end
  end
end
