class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.similar_movies id
    dir = Movie.find(id).director
    if (dir.nil?)
      return nil
    end
    return Movie.where(director: dir)
  end
end
