class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.integer :user_id
      t.integer :episode_id
      t.decimal :start_time
      t.decimal :duration
      t.text :image_url

      t.timestamps
    end
    add_index :clips, :user_id
    add_index :clips, :episode_id
  end
end
