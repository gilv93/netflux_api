class Movie < ApplicationRecord
    def self.find_by_cat(cat)
        @connection = ActiveRecord::Base.connection

        results = @connection.exec_query(
            "SELECT * FROM movies WHERE cast(movies.category as text) == '#{cat}'"
        )

        return results
    end
end
