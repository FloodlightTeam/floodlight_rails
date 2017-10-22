# ChuteServe for Rails

ChuteServe allows your Rails application to freely provide pre-configured daily data to Second Chute. It does this by mounting a set of protected API endpoints in your app. Only Second Chute can access these endpoints.

## Installation

Add this line to your application's Gemfile:

    gem 'chute_serve-rails'

And then execute:

    $ bundle

You can then install the necessary configuration by executing:

    $ bundle exec rails g chute_server:install

This will create a configuration file:

    # config/initializers/chute_serve.rb
    ChuteServe.configure do |config|
      config.access_token = ENV['CHUTE_ACCESS_TOKEN']
      config.namespace = 'api/second_chute'
    end

    # Sample usage:
    # ChuteServe.add :confirmed_users, -> { User.confirmed }
    # ChuteServe.add :unpaid_orders,   -> { Order.unpaid }

The endpoints will be mounted at the location specified by the "namespace" property.

Additionally, the installation generator will create an access token for you to provide to Second Chute. **Be sure not to lose it**. We advise storing the token in an environment variable.

## Usage

For an example of how to set up various metrics to track, check out the configuration file. The `add` method will expose an additional metric to the Second Chute application. They will automatically be picked up by our servers.

The `add` method takes two parameters -- a descriptive symbol and a lambda containing an ActiveRecord scope. Be aware that if you change the symbol name, it will track it as a separate stat.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SecondChute/chute_serve-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ChuteServe project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/SecondChute/chute_serve-rails/blob/master/CODE_OF_CONDUCT.md).
