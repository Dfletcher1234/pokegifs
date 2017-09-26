class PokemonController < ApplicationController

def index
@pokeman = Pokemon.all
end


def show
  res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
  body = JSON.parse(res.body)

  name  = body["name"]


  render json: {
        id: result["id"]
        name: result['name'],
        image: result['image_thumb_url']
      }
end
