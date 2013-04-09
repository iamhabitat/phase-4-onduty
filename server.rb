require 'sinatra'
require 'haml'
require 'trello'

enable :sessions

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
  unless session[:cached_board]# and ((session[:cached_board][0] - Time.now) / 300) > 1
    puts "updating board"
    session[:cached_board] = [Time.now, Trello::Board.find("5150ea649171af5e5b009c64")]
  end
  @board = session[:cached_board][1]

  haml :index
end
