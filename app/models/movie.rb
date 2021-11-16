class Movie < ActiveRecord::Base
    def self.all_ratings
      ['G', 'PG', 'PG-13', 'R']
    end
    
    def self.with_ratings(ratings, sort_by)
      if ratings.nil?
        all.order sort_by
      else
        where(rating: ratings.map(&:upcase)).order sort_by
      end
    end
  def self.find_in_tmdb(search_terms)
    string =URI::escape("https://api.themoviedb.org/3/movie/550?api_key=c436556a8853b2d1c4e7a427c6876d4f&"+search_terms)
    return JSON.parse(Faraday.get(string).body)["results"]
end
  
end
  