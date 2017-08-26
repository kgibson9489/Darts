require 'sinatra'
require 'mongoid'
require 'rake'

Mongoid.load! 'mongoid.yml'

# Models
class Game
  include Mongoid::Document

  field :player1
  field :player1_score, type: Integer
  field :player2
  field :player2_score, type: Integer
end

class Player
  include Mongoid::Document

  field :name, type: String
end

# Endpoints
namespace '/api/v1' do

  before do
    content_type 'application/json'
  end

  get '/games' do
    Game.all.to_json
  end

  get '/hello' do
    'Hello world!'
  end

end