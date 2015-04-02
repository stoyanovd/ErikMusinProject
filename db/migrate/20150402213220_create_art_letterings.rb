class CreateArtLetterings < ActiveRecord::Migration
  def change
    create_table :art_letterings do |t|
      t.string :name
      t.integer :show_index

      t.timestamps
    end
  end
end
