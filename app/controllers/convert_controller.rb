class ConvertController < ApplicationController

	def perform
		puts params
		clip = Clip.find(params[:clip_id])
		video = GenerateVideo.new
		video.fetch_audio(clip.episode.audio_url)
		video.fetch_photo(clip.episode.image_url)
		video.assemble_video
		send_file video.output_path
	end

	def perform
		puts params
		st = Time.now.utc.to_f

		clip = Clip.find(params[:clip_id])
		video = GenerateVideo.new
		video.fetch_audio(clip.episode.audio_url)
		video.fetch_photo(clip.episode.image_url)
		video.assemble_video

		key = "/clips/#{clip.id}/video/#{SecureRandom.hex}.mp4"
		url = S3.perform(
			bucket: ENV['BUCKET'],
			access_key: ENV['BUCKET'],
			secret_key: ENV['BUCKET'],
			key: key,
			contents: File.open(video.output_path, 'rb').read,
			content_type: 'video/mp4',
		)

		render json: {
			clip: clip,
			key: key, 
			url: url,
			time: Time.now.utc.to_f-st
		}
	end

end
