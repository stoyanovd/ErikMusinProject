class AddAttachmentFigureToLogos < ActiveRecord::Migration
  def self.up
    change_table :logos do |t|
      t.attachment :figure
    end
  end

  def self.down
    remove_attachment :logos, :figure
  end
end
