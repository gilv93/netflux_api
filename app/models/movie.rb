class Movie < ApplicationRecord
    def self.find_by_cat(cat)
       results = Movie.where(category: cat)

        return results
    end
end
