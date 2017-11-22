module Meerstats
  class Installer
    def self.perform
      if defined?(Rails)
        file_path = Rails.root.join('config', 'initializers', 'meerstats.rb')
      else
        file_path = Dir.pwd + '/config/initializers/meerstats.rb'
      end

      file_contents = <<-FILE
Meerstats.configure do |config|
  config.access_token = ENV['MEERSTATS_TOKEN']
end

# Sample usage:
# Meerstats.add_daily :confirmed_users,  -> { User.confirmed }
# Meerstats.add_daily :unpaid_orders,    -> { Order.unpaid }
# Meerstats.add_cumulative :total_users, -> { User }
FILE

      File.write(file_path, file_contents)
    end
  end
end
