json.array!(@shows) do |show|
  json.extract! show, :id, :name, :description, :distributor
  json.url show_url(show, format: :json)
end
