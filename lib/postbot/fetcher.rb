require 'active_support/core_ext/string/inflections'
require 'postbot/article'
require 'postbot/recipe'
require 'postbot/recipe/factory'

class Postbot::Fetcher
  attr_reader :recipe, :articles

  def initialize(site_name)
    @recipe = find_recipe(site_name)
    raise unless @recipe
  end
  
  def run(params = {})
    raw_articles = fetch_by_recipe(params)
    @articles = raw_articles.map do |article|
      compose_article(article)
    end
  end

  private

  def compose_article(raw_article)
    Postbot::Article.new(raw_article)
  end

  def find_recipe(site_name)
    recipe_file_path = 
      Dir[::Postbot.recipe_dir + "/*"].select { |file_name|
      File.basename(file_name) =~ /#{site_name}/
    }.first
    module_name = File.basename(recipe_file_path, '.rb').classify
    Postbot::Recipe::Factory.create(module_name, recipe_file_path)
  end

  def fetch_by_recipe(params)
    @recipe.generate(params)
  end

end

