module Sync
  class SyncController < ::ApplicationController

    protected

    def logger
      unless defined? @@sync_log
        @@sync_log ||= Logger.new(File.join(Rails.root, "log", "sync.log"))
        @@sync_log.formatter = Logger::Formatter.new
      end
      @@sync_log
    end

  end
end