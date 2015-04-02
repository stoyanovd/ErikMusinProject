class AddAttachmentImageToArtLetterings < ActiveRecord::Migration
  def self.up
    change_table :art_letterings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :art_letterings, :image
  end
end
