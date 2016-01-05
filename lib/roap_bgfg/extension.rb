require 'thread'

module Roap
  module BgFgExtension
    extend Roap::AttributeBase

    #runtime
    on /background()/ do |_super, md, *args|
      Thread.new do 
        _super.call *args
      end
    end

    #runtime
    on /foreground()/ do |_super, md, *args|
      Dispatcher.post_foreground do 
        _super.call *args
      end
    end
  end
end
