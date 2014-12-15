json.array!(@spots) do |spot|
  json.extract! spot, :id, :address, :latitude, :longitude
  json.url spot_url(spot, format: :json)
end
