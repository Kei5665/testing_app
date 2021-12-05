class ApplicationController < ActionController::Base
  # GCPの認証
  def gmap
    GoogleMapsService::Client.new(key: ENV['gmap_key'])
  end
end
