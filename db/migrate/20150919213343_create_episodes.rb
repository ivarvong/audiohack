class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :show_id
      t.text :name
      t.text :description
      t.text :image_url
      t.text :audio_url

      t.timestamps
    end
    add_index :episodes, :show_id
  end
end
