class AddMessageToClips < ActiveRecord::Migration
  def change
    add_column :clips, :message, :text
  end
end
