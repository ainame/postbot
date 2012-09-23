require 'postbot/version'
require 'postbot/client'

module Postbot
  def self.create(params = {})
    Postbot::Client.new(params)
  end

  def self.recipe_dir
    File.expand_path(File.join(File.dirname(__FILE__), '../recipients'))
  end
end

