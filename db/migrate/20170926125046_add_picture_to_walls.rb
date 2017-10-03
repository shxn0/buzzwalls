class AddPictureToWalls < ActiveRecord::Migration
  def change
    add_column :walls, :picture, :string, :after => :content
  end
end
