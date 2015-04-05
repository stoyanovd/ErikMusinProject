class AddAttachmentImageToArtIllustrations < ActiveRecord::Migration
  def self.up
    change_table :art_illustrations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :art_illustrations, :image
  end
end
