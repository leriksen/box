Box::Application.config.generators do |g|
  g.template_engine :haml
  g.test_framework :rspec
  g.fixture_replacement :factory_girl
end