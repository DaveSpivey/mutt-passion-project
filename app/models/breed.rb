class Breed < ActiveRecord::Base
  belongs_to :category
  belongs_to :mutt
  belongs_to :user
end
