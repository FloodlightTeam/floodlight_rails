require 'meerstats/installer'

module Meerstats
  class Runner
    def self.invoke
      case ARGV
      when ["install"]
        Meerstats::Installer.perform
      end
    end
  end
end
