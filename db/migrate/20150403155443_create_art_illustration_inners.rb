class CreateArtIllustrationInners < ActiveRecord::Migration
  def change
    create_table :art_illustration_inners do |t|
      t.integer :show_index
      t.references :art_illustration, index: true

      t.timestamps
    end
  end
end
