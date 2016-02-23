class Mutt < ActiveRecord::Base
  belongs_to :owner, class_name: :user
  has_many :breeds, foreign_key: :mutt_id
  has_many :pictures, foreign_key: :mutt_id

  def self.what
    breed_matcher = {}
    self.breeds.each do |breed|
      if breed_matcher.keys.include? breed.name
        breed_matcher[breed.name] += breed.value
      else
        breed_matcher[breed.name] = breed.value
      end
    end
    return breed_matcher.sort_by{|key, value| value}.reverse.first(5)
  end

end

# result.group_by { |r| r["count"] }
#       .sort_by  { |k, v| -k }
#       .first(2)
#       .map(&:last)
#       .flatten
# Most of the work is done by the group_by. The sort_by simply lines things up so that first(2) will pick off the groups you want. Then map with last will extract the count/name hashes that you started with and the final flatten will clean up the extra left over arrays.