# Releasable

[![CI](https://travis-ci.org/duytd/releasable.svg?branch=master)](https://travis-ci.org/duytd/releasable)

Pre-release Ruby On Rails application for white-list users. Release with confidence on production.

Releasing on production is quite tricky because staging/development environment cannot be 100% same as production environment. Therefore, it is better to release it first for some test users only.

This gem allows you to:
- Specify a list of users to check the feature release on production.
- After production check is done, active the feature release so that all users can access it.
- Make your customers happy :)

## Installation

Add this line to your application's Gemfile:

```
gem 'releasable'
```

And then execute:

    $ bundle

## Usage

Copy migration file by running below command:

```
  rake releasable:install
```

Then migrate database:

```
  rake db:migrate
```

Add new helper to your ApplicationController

```ruby
  helper Releasable::ReleasableHelper
```

Add this line to your routes.rb:

```ruby
  mount Releasable::Engine => "/releasable"
```

Now you can create new feature release by access `/releasable/releases`

New feature release can be checked by:

```ruby
  releasable?("7daaa288-69fd-41d3-b185-7be2d255524a", current_user)
```
## Todo

- Add rubocop to `.travis.yml` and fix all rubocop error
- Add generator for custom views

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/duytd/releasable


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

