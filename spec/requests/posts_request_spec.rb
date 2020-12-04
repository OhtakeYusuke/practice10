require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET #index" do
    subject{get(root_path)}
    context "ユーザが存在する時" do
      before do
        create_list(:user, 3)
      end
      it "リクエスト成功" do
        subject
        expect(response).to have_http_status(:ok)
      end
      it "名前が表示されている" do
        subject
        expect(response.body).to include(*Post.pluck(:title))
      end
    end
  end

  describe "GET #show" do
    subject{get(post_path(post.id))}
    let(:user) {create(:user)}
    let(:post) {create(:post, user: user)}
    context "ユーザが存在する" do
      it "リクエスト成功" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET #new" do
    subject{get(new_post_path)}
    it "リクエスト成功" do
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  # describe "POST #create" do
  #   let!(:user) {create(:user)}
  #   context "パラメータが正常なとき" do
  #     subject{post(posts_path, params: {post: attributes_for(:post)})}
  #     it "リクエスト成功" do
  #       # binding.pry
  #       subject
  #       expect(response).to have_http_status(302)
  #     end
  #   end
  # end
end
