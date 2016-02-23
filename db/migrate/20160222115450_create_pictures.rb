class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :mutt
      t.boolean :profile

      t.timestamps null: false
    end
  end
end
