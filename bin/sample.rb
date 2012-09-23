$:.unshift File.join(File.expand_path(File.dirname(__FILE__)), "../lib")
require 'postbot'

client = Postbot.create(:site => 'google_news')
client.fetch_articles
articles = client.articles

articles.each do |article|
  puts 'title: ' + article.title
  puts 'url  : ' + article.url
  puts '-------------------------------------------'
end
