require 'java'
require './features/support/jarfile/gson-2.2.4.jar'
require 'capybara'
require 'capybara/cucumber'

Capybara.app_host = 'http://www.seleniumframework.com'
Capybara.run_server = true
Capybara.default_selector = :css
Capybara.default_wait_time = 15
Capybara.ignore_hidden_elements = false


Capybara.register_driver :poltergeist do |app|
   options = {
      :js_errors => true,
      :timeout => 120,
      :debug => false,
      :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
      :inspector => true,
   }
   Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :poltergeist_debug do |app|
  Capybara::Poltergeist::Driver.new(app, inspector: true)
end

#Capybara.default_driver = :selenium
#Capybara.javascript_driver = :poltergeist
#Capybara.javascript_driver = :poltergeist_debug
Capybara.javascript_driver = :chrome
