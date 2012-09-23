require 'postbot/fetcher'

class Postbot::Client
  attr_reader :site

  def initialize(params = {})
    @site = params[:site] || 'google_news'
  end

  def fetch_articles
   @fetcher ||= Postbot::Fetcher.new(@site)
    @fetcher.run
  end

  def articles
    @fetcher.articles
  end
end
