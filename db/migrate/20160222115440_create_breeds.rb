class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :name
      t.references :category
      t.references :user
      t.references :mutt
      t.decimal :value

      t.timestamps
    end
  end
end
