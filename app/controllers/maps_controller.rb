class MapsController < ApplicationController
  protect_from_forgery
  def index
    maps = Map.all
    paths = []
    maps.each do |t|
      path = GoogleMapsService::Polyline.decode(t.encorded_path)
      paths.push(path)
    end
    gon.path = paths
  end
  
  def create
    json =  params[:data]
    json_data = JSON.parse(json)

    score = []
    arr = []

    json_data.each do |t|
      arr = [t["lat"],t["lng"]]
      score.push(arr)
    end
    encoded_path = GoogleMapsService::Polyline.encode(score)
    map_data = Map.new(encorded_path: encoded_path)
    map_data.save
  end
end
