# coding: utf-8
require 'net/https'
require 'uri'
require 'json'

class Discord_Logger
    #@POST_URL #webhook post url
    @URI
    @HTTP_Connect
    @Content
    @UserName
    @@EmbedCon = []
    def initialize(url)
       puts "Discord Logger Lib" 
       @URI = URI.parse(url)
       @HTTP_Connect = Net::HTTP::new(@URI.host,@URI.port)
       @HTTP_Connect.use_ssl = true
    end

    def SetContent(content) #POST Message
        @Content = content
    end

    def SetUserName(name) # Discord POST User Name
        @UserName = name
    end

    def EmbedCreate # Create Embed message
        @@EmbedCon[@@EmbedCon.length] = {}
        
        return @@EmbedCon.length.to_i - 1
    end

    def SetEmbedParam(path,key,value)
        @@EmbedCon[path][key] = value
    end

    def GetParam # Set Param View
        puts "UserName:"+@UserName
        puts "Content:"+@Content.to_s
    end

    def Send #Sending Discord API
        res = @HTTP_Connect.start do 
            req = Net::HTTP::Post.new(@URI.path)
            req["Content-Type"] = "application/json"
            ts = {#"content":"#{@Content.to_s.gsub(/\\n/,"\n")}",
                    "username":"#{@UserName}",
                    "embeds":@@EmbedCon
=begin
                    "embeds":[
                        {
                            "title":"SCP-040-JP - ねこです よろしくおねがいします",
                            "description":"SCP-JP 当該報告書ページ",
                            "url":"http://ja.scp-wiki.net",
                            "footer":{
                                "text":"Author:ikr-4185"
                            },
                            "author":{
                                "name":"SCP-040-JP",
                                "url":"http://ja.scp-wiki.net/scp-040-JP"
                            },
                            "fields": [
                                {
                                  "name": ":thumbsup:Vote",
                                  "value": "40",
                                  "inline":true
                                },
                                {
                                  "name": "ディスカッション",
                                  "value": "280",
                                  "inline":true
                                },
                                {
                                  "name": ":bookmark_tabs:タグ",
                                  "value": "ミーム,財団製,Thaumiel",
                                  "inline":true
                                }
                              ]
                            }
                        ]
=end                        
                    }
            req.body = ts.to_json
            puts ts.to_json
            @HTTP_Connect.request(req)
            @@EmbedCon = []
        end

    end
end
