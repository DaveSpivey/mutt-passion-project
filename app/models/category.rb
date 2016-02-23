class Category < ActiveRecord::Base
  has_many :breeds, foreign_key: :category_id
end
