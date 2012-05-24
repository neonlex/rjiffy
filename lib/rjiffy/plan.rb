module Rjiffy
  class Plan < Hashie::Mash
    class << self
      def all(token = nil)
        Request.get_data('/plans', token).collect { |plan| new(plan[1]) }
      end

      def find(id_or_name, token = nil)
        escaped_id_or_name = URI.escape(id_or_name.to_s)
        new(Request.get_data("/plans/#{escaped_id_or_name}", token))
      end
    end
  end
end
