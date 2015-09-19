require 'open-uri'
class GenerateVideo

	attr_accessor :output_path, :input_photo_path, :input_audio_path, :intermediate_audio_path, :audio_start, :audio_duration

	def initialize
		self.output_path = Tempfile.new('output').path + ".mp4"
		self.input_photo_path = Tempfile.new('input_photo').path
		self.input_audio_path = Tempfile.new('input_audio').path
		self.intermediate_audio_path = Tempfile.new('intermediate_audio').path + ".mp3"
		self.audio_start = 0
		self.audio_duration = 15
		self
	end

	def fetch_photo(url)
		f = File.open(@input_photo_path, 'wb')
		f.write HTTParty.get(url).body
		f.close
		self
	end

	def fetch_audio(url)
		f = File.open(@input_audio_path, 'wb')
		f.write HTTParty.get(url).body
		f.close
		self
	end

	def cut_audio
		command = "ffmpeg -ss #{audio_start} -t #{audio_duration} -i '#{input_audio_path}' '#{intermediate_audio_path}'"
		@cut_audio_result = `#{command}`
		self
	end

	# def assemble_video
	# 	command = "ffmpeg -loop 1 -i #{input_photo_path} -c:v libx264 -t #{audio_duration} -pix_fmt yuv420p #{output_path}"
	# 	@assemble_video_result = `#{command}`
	# 	self
	# end

	def assemble_video
		#command = "ffmpeg -i #{input_photo_path} -i #{intermediate_audio_path} -c:v libx264 -c:a copy -shortest #{output_path}"
		command = "ffmpeg -loop 1 -i #{input_photo_path} -i #{input_audio_path} -c:v libx264 -c:a aac -strict experimental -b:a 192k -shortest -r 1 ./out.mp4"
		@assembled_video_result = `#{command}`
		`open #{output_path}`
		self
	end

end