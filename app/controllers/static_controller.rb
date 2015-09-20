class StaticController < ApplicationController
  def index
  end

  def embed
  end

  def proxy
  	url = params[:url]
  	fileslug = url.split('/').last
  	
  	temp = Tempfile.new('proxy').path + fileslug
  	
  	File.open(temp, 'wb') do |f|
  		f.write HTTParty.get(url).body
  	end
  	send_file temp

  end
end
