class PokemonController < ApplicationController




def show
  res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
  body = JSON.parse(res.body)

  res1 = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=OfdmRoqCqDyM1zt0L8XZUl2QciOssj9o&q=pikachu&rating=g")
  body1 = JSON.parse(res1.body)

# byebug
render json: {

    id: body["id"],
    name: body["name"],
    # types: body["types"].find { |type| type[:type] },
    types: body["types"].map { |x| x["type"]["name"] },

    gif_url: body1["data"][0]["url"]

  }

    end
end
