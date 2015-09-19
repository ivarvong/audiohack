class ConvertController < ApplicationController
  def test
  		video = GenerateVideo.new
  		video.fetch_audio("http://stream.thisamericanlife.org/promos/567.mp3")
  		video.fetch_photo("http://www.thisamericanlife.org/sites/default/files/imagecache/large_square/episodes/567.jpg")
  		video.assemble_video
  		send_file video.output_path
  end
end
