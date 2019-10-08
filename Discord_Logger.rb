require 'net/https'
require 'uri'
require 'json'

class Discord_Logger
    #@POST_URL #webhook post url
    @URI
    @HTTP_Connect
    @Content
    def initialize(url)
       puts "Discord Logger Lib" 
       @URI = URI.parse(url)
       @HTTP_Connect = Net::HTTP::new(@URI.host,@URI.port)
       @HTTP_Connect.use_ssl = true
    end

    def SetContent(content)
        @Content = content
    end

    def GetParam
        puts "Content:"+@Content
        
    end



    def Send
        @HTTP_Connect.start do 
            req = Net::HTTP::Post.new(@URI.path)
            req["Content-Type"] = "application/json"
            ts = {"content":"ねこです よろしくおねがいします","username":"SCP-040-JP"}
            req.body = ts.to_json
            @HTTP_Connect.request(req)
        end
    end

end