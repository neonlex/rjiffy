module Rjiffy
  class Box < Hashie::Mash
    class << self
      def all(token = nil)
        Request.get_data('/jiffyBoxes', token).collect { |box| new(box[1], token) }
      end

      def find(id, token = nil)
        new(Request.get_data("/jiffyBoxes/#{id}", token), token)
      end

      def create(params = {}, token = nil)
        new(Request.post_data('/jiffyBoxes', params, token), token)
      end
    end

    def initialize(source_hash = nil, token = nil)
      @token = token
      super(source_hash)
    end

    def reload
      merge!(Request.get_data("/jiffyBoxes/#{id}", @token))
    end

    def delete
      Request.delete_data("/jiffyBoxes/#{id}", @token)
      self.status = "DELETING"
      self
    end

    def backups
      Backup.new(Request.get_data("/backups/#{id}", @token))
    end

    def create_recurring_backup(date_time_id = {})
      Backup.new(Request.post_data("/backups/#{id}", date_time_id, @token))
    end

    def thaw(planid)
      merge!(Request.put_data("/jiffyBoxes/#{id}", "status=THAW&planid=#{planid}", @token))
    end

    [:start, :shutdown, :pullplug, :freeze].each do |method|
      define_method(method) do
        merge!(Request.put_data("/jiffyBoxes/#{id}", "status=#{method.to_s.upcase}", @token))
      end
    end

  end
end
