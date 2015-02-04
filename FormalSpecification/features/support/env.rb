require 'capybara/cucumber'

Capybara.app_host = 'http://localhost:8080/bookstore/'
Capybara.run_server = false
Capybara.default_driver = :selenium



