class ApplicationController < Sinatra::Base

#add this line to set the Content-type header fr all responses
set :default_content_type, 'application/json'

 get '/games' do
   games=Game.all.order(:title).limit(10)
   games.to_json
  end

  # use the :id syntax to create a dynamic route
  get '/games/:id' do
    # look up the game in the database using its ID
    # send a JSON-formatted response of the game data
    game=Game.find(params[:id])
    # send a JSON-formatted response of the game data 
  # include the associated reviews in the json responses
  game.to_json(include: { reviews: { include: :user } })

  end
end
