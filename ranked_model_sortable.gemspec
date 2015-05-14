$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "ranked_model_sortable"
  s.version     = "1.0.0"
  s.authors     = ["Ryan Burnette"]
  s.email       = ["ryan.burnette@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RankedModelSortable."
  s.description = "TODO: Description of RankedModelSortable."
  s.license     = "Apache2"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "ranked_model"
end
