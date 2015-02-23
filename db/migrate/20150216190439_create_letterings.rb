class CreateLetterings < ActiveRecord::Migration
  def change
    create_table :letterings do |t|
      t.string :name

      t.timestamps
    end
  end
end
