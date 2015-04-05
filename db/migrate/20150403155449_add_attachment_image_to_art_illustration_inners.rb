class AddAttachmentImageToArtIllustrationInners < ActiveRecord::Migration
  def self.up
    change_table :art_illustration_inners do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :art_illustration_inners, :image
  end
end
