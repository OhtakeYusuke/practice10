crumb :root do
  link "投稿一覧", root_path
end

crumb :post_show do |post|
  link "#{post.title}の詳細", post_path(post)
  parent :root
end

crumb :post_edit do |post|
  link "#{post.title}の編集", edit_post_path(post)
  parent :post_show, post
end

crumb :post_new do
  link "新規投稿", new_post_path
  parent :root
end

crumb :user_show do |user|
  link "#{user.name}の詳細", user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link "#{user.name}の編集", edit_user_path(user)
  parent :user_show, user
end

crumb :user_new do 
  link "新規登録画面", new_user_path
  parent :root
end

crumb :user_new_confirm do |user|
  link "確認画面", confirm_new_user_path
  parent :user_new
end
