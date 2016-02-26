class ChangeBreedsValueFromDecimalToInteger < ActiveRecord::Migration
  def change
    change_column :breeds, :value, :integer
  end
end
