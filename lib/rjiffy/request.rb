module Rjiffy
  class Request
    class << self
      def get_data(url, token = nil)
        process_response(Configuration.base_uri(:token => token)[url].get.deserialize)
      end

      def post_data(url, params, token = nil)
        process_response(Configuration.base_uri(:token => token)[url].post_form(params).deserialize)
      end

      def delete_data(url, token = nil)
        process_response(Configuration.base_uri(:token => token)[url].delete.deserialize)
      end

      def put_data(url, params, token = nil)
        process_response(Configuration.base_uri(:token => token)[url].put(params).deserialize)
      end

      private
      def process_response(response)
        Result.new(response).data
      end
    end
  end
end
