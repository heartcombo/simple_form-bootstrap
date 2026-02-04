source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.7"

gem "rails", "~> 8.1.0"
gem "sprockets-rails"
gem "puma"
gem "importmap-rails"
# gem "turbo-rails"
gem "stimulus-rails"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# Custom
gem 'bootstrap', '~> 5.1'
gem 'inline_svg', '~> 1.7'
gem 'kramdown', '~> 2.3'
gem 'kramdown-parser-gfm', '~> 1.1'
gem 'rails-i18n'
gem 'rouge', '~> 3.26'
gem 'simple_form', '~> 5.1'

group :test, :development do
  gem 'diffy'
  gem 'equivalent-xml'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
