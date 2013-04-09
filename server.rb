require 'sinatra'
require 'haml'
require 'trello'

enable :sessions

TRELLO_BOARD = "5150ea649171af5e5b009c64"

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_KEY']
  config.member_token = ENV['TRELLO_TOKEN']
end


before do
  unless ENV['TRELLO_KEY'] and ENV['TRELLO_TOKEN']
    raise "You need to set ENV['TRELLO_KEY'] and ENV['TRELLO_TOKEN']!"
  end
end


get '/' do
  @board = Trello::Board.find(TRELLO_BOARD)

  haml :index
end
