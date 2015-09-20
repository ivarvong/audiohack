class AddOriginalUrlToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :show_url, :text
  end
end
