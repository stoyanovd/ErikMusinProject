class AddAttachmentImageToArtLogos < ActiveRecord::Migration
  def self.up
    change_table :art_logos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :art_logos, :image
  end
end
