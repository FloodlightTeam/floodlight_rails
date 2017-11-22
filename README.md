# meerstats for Rails

[meerstats](https://www.meerstats.com) helps you stop bugs in their tracks. We provide an easy way to gain insight into your data and notify you if we see problems.

This gem allows your Rails application to freely provide pre-configured daily data to meerstats. It does this by mounting a set of protected API endpoints in your app. Only meerstats can access these endpoints.

## Installation

Add this line to your application's Gemfile:

    gem 'meerstats_rails', require: 'meerstats'

And then execute:

    $ bundle

You can then install the necessary configuration by executing:

    $ meerstats install

This will create a configuration file:

    # config/initializers/meerstats.rb
    Meerstats.configure do |config|
      config.access_token = ENV['MEERSTATS_TOKEN']
    end

    # Sample usage:
    # Meerstats.add_daily :confirmed_users,  -> { User.confirmed }
    # Meerstats.add_daily :unpaid_orders,    -> { Order.unpaid }
    # Meerstats.add_cumulative :total_users, -> { User }

You will need to check your application dashboard for your access token. By default, we advise storing it in an environment variable in your production environment.

## Usage

For an example of how to set up various metrics to track, check out the configuration file. The `add_daily` and `add_cumulative` methods will expose additional metrics to the meerstats service. The metrics will automatically be picked up by our servers.

These method take two parameters -- a descriptive symbol and a lambda containing an ActiveRecord scope. Be aware that if you change the symbol name, it will track it as a separate metric.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/meerstats/meerstats_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the meerstats project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/meerstats/meerstats_rails/blob/master/CODE_OF_CONDUCT.md).
