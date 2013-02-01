source 'https://rubygems.org'

gem 'rails', '3.2.11'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'crowdint_auth'
gem 'devise'
gem 'haml_assets'
gem 'haml-rails'
gem 'handlebars_assets'
gem 'jquery-rails'
gem 'kaminari'
gem 'rabl'
gem 'rails-backbone'
gem 'acts_as_votable',
    git: 'git://github.com/supherman/acts_as_votable.git',
    branch: 'sti-voter'
gem 'unicorn'

gem 'voting_app',
    git: 'git://github.com/crowdint/voting_engine.git'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
