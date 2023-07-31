require 'byebug'
require 'csv'
class ImportMovieService
  def perform
    csv_file1 = Rails.root.join('./movies.csv')
    CSV.foreach(csv_file1, headers: true) do |row|
      movie_obj = Movie.find_or_initialize_by(
        name: row['Movie'], 
        description: row['Description'],
        year: row['Year'],
        director: row['Director']
      ) 
      movie_obj["country_id"] = set_country(row['Country'], row['Filming location'])
      movie_obj.save!
      create_actor(row["Actor"],movie_obj)
        #  filming_location: row['Filming Location'], 
    end
    puts "Data import completed successfully."
  end

  private 
    def create_actor(actor_name, movie) 
      byebug
      actor = Actor.find_by(name: actor_name)
      if actor.present? 
        movie.actors << actor
      else
        actor = Actor.create(name: actor_name)
        movie.actors << actor
      end
    end

    def set_country(country_name, location) 
      country = Country.find_by(name: country_name)
      if country.present?
        set_filming_location(country, location)
        country.id
      else
        country = Country.create(name: country_name)
        set_filming_location(country, location)
        country.id
      end
    end

    def set_filming_location(country, location) 
      filming_location = FilmingLocation.find_by(name: location)
      if filming_location.present?
        filming_location.country_id = country.id
      else
        filming_location = FilmingLocation.create(name: location, country_id: country.id)
      end 
    end
  

end