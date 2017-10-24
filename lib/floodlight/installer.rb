module Floodlight
  class Installer
    def self.perform
      if defined?(Rails)
        file_path = Rails.root.join('config', 'initializers', 'floodlight.rb')
      else
        file_path = Dir.pwd + '/config/initializers/floodlight.rb'
      end

      file_contents = <<-FILE
Floodlight.configure do |config|
  config.access_token = ENV['FLOODLIGHT_TOKEN']
end

# Sample usage:
# Floodlight.add_daily :confirmed_users,  -> { User.confirmed }
# Floodlight.add_daily :unpaid_orders,    -> { Order.unpaid }
# Floodlight.add_cumulative :total_users, -> { User }
FILE

      File.write(file_path, file_contents)
    end
  end
end
