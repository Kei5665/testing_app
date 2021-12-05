class ScoresController < ApplicationController
  def index
    path = [
      [-33.8671, 151.20714],
      [-33.86708, 151.20683000000002],
      [-33.867070000000005, 151.20674000000002],
      [-33.86703, 151.20625]
    ]
    @results = gmap.snap_to_roads(path, interpolate: true)
  end
end
