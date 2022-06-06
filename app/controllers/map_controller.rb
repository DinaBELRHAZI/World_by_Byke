require 'net/http'
class MapController < ApplicationController
  def index

    uri = URI("https://api.citybik.es/v2/networks")
    response = Net::HTTP.get_response(uri)



    p"****************************************************************************************"

    data = JSON.parse(response.body)
    @arraypoint = []
    @arrayinfo = []
    p data["networks"][1]
    for item in data["networks"]
      tempopoint = [item["location"]["latitude"], item["location"]["longitude"]]
      tempoinfo =  [item["name"], item["location"]["city"], item["location"]["country"]]
      @arraypoint.push(tempopoint)
      @arrayinfo.push(tempoinfo)
    end
    p "****************************************************************************************"
    for key, value in data["networks"][1]
      p "#{key} => #{value}"
      if key == "location"
        p data["networks"][1]["location"]["latitude"]
        p data["networks"][1]["location"]["longitude"]
      end
    end
    @arraycenter = [data["networks"][1]["location"]["latitude"], data["networks"][1]["location"]["longitude"]]
    p "-----------------------------------------"

    @arraypointbdd = []
    @arrayinfobdd = []

      veloLong = Velo.select(:longitude).map(&:longitude)
      veloLat = Velo.select(:latitude).map(&:latitude)
      name = Velo.select(:name).map(&:name)
      city = Velo.select(:city).map(&:city)
      country = Velo.select(:country).map(&:country)
      company = Velo.select(:company).map(&:company)
      veloCoord = veloLat, veloLong
      veloInfo = name, city, country, company
      @arraypointbdd.push(veloCoord)
      @arrayinfobdd.push(veloInfo)

      p veloLong[1]
      p veloLat[1]






  end



end
