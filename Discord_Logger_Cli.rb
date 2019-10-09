#!/usr/bin/env ruby

require_relative 'Discord_Logger'
require 'optparse'
option = {}
OptionParser.new do |opt|
    opt.on('-p value','role') {|val|
        @url = val
    }

    opt.on('-c value','content'){|val|
        @content = val
    }

    opt.on('-n value','name') {|val|
        @userName = val
    }

    opt.parse!(ARGV)
end


DisLog = Discord_Logger.new(@url)
#DisLog.SendingUser("Clowler IL-334")
DisLog.SetContent(@content)
DisLog.SetUserName(@userName)
DisLog.GetParam
DisLog.Send
