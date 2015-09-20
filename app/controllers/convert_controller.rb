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

	def process(test)
		puts params
		st = Time.now.utc.to_f

		clip = Clip.find(params[:clip_id])
		
		video = GenerateVideo.new
		
		video.fetch_audio(clip.episode.audio_url)
		video.fetch_photo(clip.episode.image_url)
		video.audio_start    = clip.start_time
		video.audio_duration = clip.duration

		video.assemble_video # slow step

		video_key = "clips/#{clip.id}/video/#{SecureRandom.hex}.mp4"
		video_url = S3Uploader.perform(
			bucket: ENV['BUCKET'],
			access_key: ENV['ACCESS_KEY'],
			secret_key: ENV['SECRET_KEY'],
			key: video_key,
			contents: File.open(video.output_path, 'rb').read,
			content_type: 'video/mp4',
		)

		clip.video_url = video_url
		clip.save

		render json: {
			clip: clip,
			video_key: video_key, 
			video_url: video_url,
			time: Time.now.utc.to_f-st
		}
	end

end
