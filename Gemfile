source 'https://rubygems.org'

ruby File.read(File.expand_path('../.ruby-version', __FILE__)).chomp

gem 'bcrypt','~> 3.1.11'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise'
gem 'figaro'
gem 'foundation_emails', '~> 2.1'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'mailgun-ruby', '~>1.0.2', require: 'mailgun'
gem 'momentjs-rails', '>= 2.9.0'
gem 'omniauth-stripe-connect', '~> 2.10'
#gem 'pg'
#gem 'pg', '>= 0.18', '< 2.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
gem 'premailer-rails', '~> 1.9', '>= 1.9.7'
gem 'puma'
gem 'rails', '4.2.6'
gem 'rest-client', require: 'rest-client'
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'stripe'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'american_date', '~> 1.1', '>= 1.1.1'

gem "font-awesome-rails"
gem "select2-rails"

group :development, :test do
  gem 'awesome_print'
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver', '~> 3.2'
end

group :development do
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'spring'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
end

group :production do
  gem 'rails_12factor'
end
