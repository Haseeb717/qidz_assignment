require 'csv'

namespace :misc do

	#Populate all Movies from CSV
  task :populate_movies => :environment do
		csv_text = File.read("movies.csv")
		csv_rows = CSV.parse(csv_text, :headers => true)
		csv_rows.each do |row|
		  movie = Movie.find_by_name(row["Movie"]) #check if movie already exists
		  unless movie.present?
		  	Movie.create(:name=>row["Movie"],:description=>row["Description"],:year=>row["Year"],:director=>row["Director"],:actor=>row["Actor"],:filming_location=>row["Filming location"],:country=>row["Country"])
		  end
		end
	end

	#Populate all reviews of movies
	task :populate_reviews => :environment do
		csv_text = File.read("reviews.csv")
		csv_rows = CSV.parse(csv_text, :headers => true)
		csv_rows.each do |row|
		  movie = Movie.find_by_name(row["Movie"])
		  if movie.present?
		  	Review.create(:movie_id=>movie.id,:username=>row["User"],:rating=>row["Stars"],:comment=>row["Review"])
		  end
		end
	end

end