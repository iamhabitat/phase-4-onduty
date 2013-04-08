require 'sinatra'
require 'haml'
require 'trello'

TRELLO_KEY = "46bf7a717a5e6ed3ed5be94e5448358b";
TRELLO_TOKEN = "f769b642237eb2ed7006a7ca7e9b187e1f9dc4194dcca431bddf7b8e185bb363";
#TRELLO_SECRET = "18db07004aa21155610108fb959e6b6a306f2555f90b17195290d3360720c51c";

Trello.configure do |config|
  config.developer_public_key = TRELLO_KEY
  config.member_token = TRELLO_TOKEN
end


get '/' do
  @board = Trello::Board.find("5150ea649171af5e5b009c64")

  haml :index
end
