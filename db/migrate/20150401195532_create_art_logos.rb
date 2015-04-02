class CreateArtLogos < ActiveRecord::Migration
  def change
    create_table :art_logos do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end
