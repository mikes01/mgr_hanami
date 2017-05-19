source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       git: 'git@github.com:hanami/hanami.git'
gem 'hanami-model', git: 'git@github.com:hanami/model.git'

gem 'pg'

gem 'nokogiri', '1.7.1'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'byebug'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end

gem 'hanami-bootstrap'
gem 'jquery-hanami'
gem 'sass'
gem 'rgeo'
gem 'rgeo-shapefile'

gem 'roar'
gem 'multi_json'