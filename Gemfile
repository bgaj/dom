source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml'
gem 'cancancan', '1.15.0'
gem 'devise', '4.2.0'
gem "paperclip", "~> 5.0.0"
gem "paperclip-compression", '0.3.16'
gem 'friendly_id', '5.1.0'
gem "cocoon"
gem 'autoprefixer-rails', '6.5.3'
gem 'selectize-rails', '0.12.4'
gem 'tinymce-rails', '4.4.3'
gem 'simple_form'
gem "breadcrumbs_on_rails"
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'kaminari'
gem 'twilio-ruby', '~> 5.3.1'
gem 'whenever', :require => false
gem 'mina'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'letter_opener', '1.4.1'
  gem 'letter_opener_web', '1.3.1'
  gem 'web-console', '3.4.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring', '2.0.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'binding_of_caller', '0.7.2'
  gem 'better_errors', '2.1.1'
  gem 'awesome_print', '1.7.0'
  gem 'rails_real_favicon', '0.0.6'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
