# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for Ruby. It is the primary way to install Ruby packages (also known as Gems).

#### Installing Gems

You need to create a Gemfile and define the required packages (Gems) in that file

```ruby
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Running the `bundle install` command will install the Gems on the system globally (unlike NodeJS which installs the packages in the `node_modules` folder)

Similar to a terraform lock file, a `Gemfile.lock` will also be created to lockdown the Gem versions used in the project.

#### Executing Ruby Scripts in the context of the bundler

We have to use the the command `bundle exec` to tell future Ruby scripts to use the gems we installed. This is the way we set context.

### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps. 

It is great for mock, development servers or very simple projects. Find more [info here](https://sinatrarb.com)

## Terratowns Mock server

### Running the web server

We can run the web server by executing the following commands: 

```ruby
bundle install
bundle exec ruby server.rb
```

All the code for the webserver is in the `server.rb` file.