# # lib/tasks/import_data.rake
# require 'csv'
# namespace :import do
#   desc "Import data from CSV files"
#   task :data => :environment do
#     # Path to your CSV files
#     debugger
#     csv_file1 = Rails.root.join('movies.csv')
#     csv_file1 = Rails.root.join('reviews.csv')

#     # Read data from the first CSV file
#     CSV.foreach(csv_file1, headers: true) do |row|
#       Movie.create!(title: row['title'], description: row['description'],year: row['year'], director: row['director'], actor: row['actor'], filming_location: row['filming_location'], country: row['country'])
#     end

#     # Read data from the second CSV file
#     CSV.foreach(csv_file2, headers: true) do |row|
#       Review.create!(: row['column1'], column2: row['column2'])
#     end

#     puts "Data import completed successfully."
#   end
# end
