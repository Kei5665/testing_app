class MapsController < ApplicationController
  protect_from_forgery
  def index
  end
  def new
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
