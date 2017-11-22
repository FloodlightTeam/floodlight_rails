module Meerstats
  module StubAccessToken
    module ClassMethods
      def stub_access_token!(token)
        before do
          Meerstats.configure do |config|
            config.access_token = token
          end
        end
      end
    end
      
    def self.included(receiver)
      receiver.extend         ClassMethods
    end
  end
end
