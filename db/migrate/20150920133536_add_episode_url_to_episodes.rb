class AddEpisodeUrlToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :episode_url, :text
  end
end
