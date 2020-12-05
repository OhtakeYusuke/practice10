namespace :greet_practice do
  desc "Rakeタスク練習用"
  task hello: :environment do
    puts "こんにちは"
  end
end
