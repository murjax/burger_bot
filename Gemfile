source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.2.1'

gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'sprockets-rails'
gem 'puma', '~> 5.0'
gem 'pg'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'money-rails'
gem 'tailwindcss-rails'
gem 'devise'
gem 'image_processing', '~> 1.2'
gem 'font-awesome-sass', '~> 6.4.0'
gem 'aws-sdk-s3', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'pry-rails'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
