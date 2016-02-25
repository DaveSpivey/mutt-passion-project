class AddLinkToBreeds < ActiveRecord::Migration
  def change
    add_column :breeds, :link, :string
  end
end
