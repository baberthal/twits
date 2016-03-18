source 'https://rubygems.org'

# Specify your gem's dependencies in twits.gemspec
gemspec

group :development, :test do
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'pry', require: false
  gem 'pry-theme', require: false
  gem 'pry-byebug', require: false
  gem 'guard', require: false
  gem 'rb-fsevent', require: false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec', require: false
  gem 'ruby_gntp', require: false
end
