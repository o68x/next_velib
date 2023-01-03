# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.6.2'
File.read('./.ruby-version')

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'ahoy_matey'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dotenv-rails', '~> 2.7.2'
gem 'geocoder', '~> 1.5', '>= 1.5.1'
gem 'hiredis'
gem 'httparty', '~> 0.21.0'
gem 'humanize', '~> 2.3'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'public_suffix', '~> 3.1', '>= 3.1.1'
gem 'puma', '~> 3.12'
gem 'rails', '~> 6.0.0.rc1'
gem 'redis-rails'
gem 'sass-rails', '~> 5'
gem 'sentry-raven', '~> 2.9.0'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'awesome_print'
  gem 'debase', '~> 0.2.3'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'pry-byebug', '~> 3.6'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'ruby-debug-ide'
end

group :development do
  gem 'annotate', '~> 2.7', '>= 2.7.4'
  gem 'husky', '~> 0.5.15'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner', '~> 1.7'
  gem 'faker', '~> 1.9', '>= 1.9.3'
  gem 'percy-capybara', '~> 4.0.0'
  gem 'rspec-sidekiq'
  gem 'rspec_junit_formatter', '~> 0.4.1'
  gem 'shoulda-matchers', '~> 4.1'
  gem 'simplecov', '~> 0.16.1', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
