class AddAttachmentFigureToIllustrations < ActiveRecord::Migration
  def self.up
    change_table :illustrations do |t|
      t.attachment :figure
    end
  end

  def self.down
    remove_attachment :illustrations, :figure
  end
end
