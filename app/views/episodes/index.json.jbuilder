json.array!(@episodes) do |episode|
  json.extract! episode, :id, :show_id, :name, :description, :image_url, :audio_url
  json.url episode_url(episode, format: :json)
end
