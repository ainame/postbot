class Postbot::Article
  attr_accessor :title, :body, :url, :updated

  def initialize(params = {})
    @title     = params[:title] || ''
    @body      = params[:body] || ''
    @url       = params[:url] || ''
    @updated   = params[:updated] || ''
  end
end
