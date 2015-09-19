json.array!(@clips) do |clip|
  json.extract! clip, :id, :user_id, :episode_id, :start_time, :duration, :image_url
  json.url clip_url(clip, format: :json)
end
