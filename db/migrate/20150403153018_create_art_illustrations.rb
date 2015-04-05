class CreateArtIllustrations < ActiveRecord::Migration
  def change
    create_table :art_illustrations do |t|
      t.string :name
      t.integer :show_index
      t.string :back_color

      t.timestamps
    end
  end
end
