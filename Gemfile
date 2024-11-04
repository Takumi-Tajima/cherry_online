source "https://rubygems.org"

gem "rails", "~> 7.2.1"

gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem 'haml-rails'
gem 'simple_form'


gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem 'haml_lint'
end

group :development do
  gem 'rubocop', require: false
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'
  gem 'bullet'
  gem 'html2haml'
  gem "web-console"
end

group :test do
  gem 'capybara'
end
