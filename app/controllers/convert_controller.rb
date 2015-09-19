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

end
