module Rjiffy
  require 'wrest'
  require 'hashie'

  class << self
    def backups(token = nil)
      Request.get_data('/backups', token).collect { |backup| Backup.new(backup[1]) }
    end
  end

  require 'rjiffy/configuration'
  require 'rjiffy/request'
  require 'rjiffy/result'
  require 'rjiffy/backup'
  require 'rjiffy/box'
  require 'rjiffy/plan'
  require 'rjiffy/distributions'
  require 'rjiffy/exceptions'
end
