module Postbot::Recipe::Factory
  def self.create(module_name, path)
    Postbot::Recipe.autoload module_name.to_sym, path
    klass = Postbot::Recipe.const_get(module_name)
    klass.new
  end
end
