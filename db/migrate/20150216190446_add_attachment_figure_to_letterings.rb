class AddAttachmentFigureToLetterings < ActiveRecord::Migration
  def self.up
    change_table :letterings do |t|
      t.attachment :figure
    end
  end

  def self.down
    remove_attachment :letterings, :figure
  end
end
