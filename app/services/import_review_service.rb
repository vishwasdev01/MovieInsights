require 'byebug'
require 'csv'
class ImportReviewService
  def perform
    csv_file2 = Rails.root.join('./reviews.csv')
    CSV.foreach(csv_file2, headers: true) do |row|
      review_obj = Review.find_or_initialize_by(
        movie_id: find_movie(row['Movie']), 
        stars: row['Stars'],
        review: row['Review'],
        user_id: set_user(row["User"])
      ) 
      review_obj.save!
    end
    puts "Data import completed successfully."
  end

  private 

  def find_movie(movie_name) 
    Movie.find_by(name: movie_name).id
  end

  def set_user(user_name) 
    byebug
    user = User.find_by(name: user_name)
    if user.present? 
     return user.id
    else  
      user = User.create(name: user_name)
      return user.id
    end
  end
  
end
