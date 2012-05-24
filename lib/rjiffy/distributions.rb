module Rjiffy
  class Distribution < Hashie::Mash
    class << self
      def all(token = nil)
        Request.get_data('/distributions', token).collect { |distribution| new(add_id_to_result(distribution[0], distribution[1])) }
      end

      def find(id, token = nil)
        new(add_id_to_result(id, Request.get_data("/distributions/#{id}", token)))
      end

      private
      def add_id_to_result(id, result)
        result['id'] = id
        result
      end
    end
  end
end
