class RenameOrderToArtLogos < ActiveRecord::Migration
  def change
    rename_column :art_logos, :order, :show_index
  end
end
