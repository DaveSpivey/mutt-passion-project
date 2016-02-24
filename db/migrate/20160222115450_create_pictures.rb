class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :mutt
      t.boolean :profile, default: false
      t.string :url

      t.timestamps null: false
    end
  end
end
