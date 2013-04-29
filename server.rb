require 'sinatra'
require 'haml'
require 'trello'

# Read in the trello config from the environment. Halts if any config value is
# missing.
trello_conf = %w(TRELLO_KEY TRELLO_TOKEN TRELLO_BOARD).
  reduce({}) do |conf, vname|
    abort "Please set #{vname} in the environment" unless ENV.has_key? vname
    conf_key = vname.split('_').last.downcase.to_sym
    conf.merge! conf_key => ENV[vname]
  end

Trello.configure do |config|
  config.developer_public_key = trello_conf[:key]
  config.member_token = trello_conf[:token]
end

before do
  @board = Trello::Board.find trello_conf[:board]
  @today = Time.now
end

get '/' do
  haml :day
end

get '/week' do
  haml :week
end
