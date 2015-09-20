class AddVideoUrlToClips < ActiveRecord::Migration
  def change
    add_column :clips, :video_url, :text
  end
end
