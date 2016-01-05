require 'thread'

module Roap
  module BgFgExtension
    class Dispatcher
      @@jobs = Queue.new

      def self.post_foreground &job
        @@jobs.enq job
      end

      def self.dispatch
        while @@jobs.empty? == false
          job = @@jobs.deq
          job.call
        end
      end
    end
  end
end
