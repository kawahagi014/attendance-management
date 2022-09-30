source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby "2.6.6"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1.5", ">= 6.1.5.1"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem "bcrypt", "3.1.13"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false
gem "mongoid", "~> 7.0.5"
gem "pry-rails"
gem "haml-rails"
gem "rails-i18n"
gem "holiday_japan"
gem "dotenv-rails"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-byebug"
end

group :development do
  gem "web-console",           "4.0.1"
  gem "listen",                ">=3.0.5", "<4.0"
  # gem 'spring',                '2.1.0'
  # gem 'spring-watcher-listen', '2.0.1'
  gem "rubocop"
end

group :test do
  gem "capybara",                 "3.28.0"
  gem "selenium-webdriver",       "3.142.4"
  gem "webdrivers",               "4.1.2"
  gem "rails-controller-testing", "1.0.4"
  gem "minitest",                 "5.11.3"
  gem "minitest-reporters",       "1.3.8"
  gem "guard",                    "2.16.2"
  gem "guard-minitest",           "2.4.6"
end

group :production do
  gem "pg", "1.1.4"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
