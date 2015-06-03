require 'simplecov'
require "spec_helper"

require 'spork'
require 'capybara/rspec'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require 'rails/all'
  require 'rspec/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  require File.expand_path("../../config/environment", __FILE__)

  # turn off noise AR logger - must come before migration check
  ActiveRecord::Base.logger.level = 1

  RSpec.configure do |config|
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.infer_spec_type_from_file_location!

    config.include FactoryGirl::Syntax::Methods

    config.include Devise::TestHelpers, type: :controller
    config.include Devise::TestHelpers, type: :view
  end
end

Spork.each_run do
  load "#{Rails.root}/config/routes.rb"
  Dir["#{Rails.root}/app/**/*.rb"].each {|f| load f}
  Dir["#{Rails.root}/lib/**/*.rb"].each {|f| load f}
end