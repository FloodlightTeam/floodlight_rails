require 'floodlight/installer'

module Floodlight
  class Runner
    def self.invoke
      case ARGV
      when ["install"]
        Floodlight::Installer.perform
      end
    end
  end
end
