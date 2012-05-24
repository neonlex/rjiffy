module Rjiffy
  class Configuration

    API_VERSION = "v1.0"

    class << self
      attr_accessor :token

      def configure
        yield self
      end

      def base_uri(options = {})
        "https://api.jiffybox.de/#{options[:token] || token}/#{API_VERSION}".to_uri
      end
    end

  end
end
