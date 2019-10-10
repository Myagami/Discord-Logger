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

    opt.on('--NSEND','not send'){|val|
        @send = 1
    }
    opt.parse!(ARGV)
end


DisLog = Discord_Logger.new(@url)
#DisLog.SendingUser("Clowler IL-334")
DisLog.SetContent(@content)
DisLog.SetUserName(@userName)
embedPath = DisLog.EmbedCreate
puts embedPath
DisLog.SetEmbedParam(embedPath,"title","TEST_FILE")
DisLog.SetEmbedParam(embedPath,"description","/home/honoka/hoge/foo")
DisLog.SetEmbedParam(embedPath,"footer",{
    "text":"Editer:BOSS"

})
DisLog.SetEmbedParam(embedPath,"fields",[
    {
        "name": "dat",
        "value": "40",
        "inline":true
    },{
        "name": "png",
        "value": "40",
        "inline":true
    },{
        "name": "pak",
        "value": "40"        
    }

])
DisLog.GetParam
#--NSEND true not sending discord server
if @send != 1 then
    DisLog.Send
end
