# -*- coding: utf-8 -*-
require 'open-uri'
require 'feed-normalizer'

class Postbot::Recipe::GoogleNews
  def generate(params)
    articles = []
    base_url = "https://news.google.com/news/feeds?hl=ja&ned=us&ie=UTF-8&oe=UTF-8&output=atom&q="
    key_word = '"事前登録"'
    source = base_url + URI.encode(key_word)
    feed = FeedNormalizer::FeedNormalizer.parse open(source)
    articles = feed.items.map do |entry|
      {
        :title => entry.title,
        :body  => entry.content,
        :url   => entry.urls.first.gsub('&amp;', '&'),
        :updated => entry.last_updated.to_s,
      }         
    end
    
    articles
  end
end
