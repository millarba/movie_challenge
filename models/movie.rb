class Movie
  attr_reader :name

  def initialize(name, length, rating)
    @name = name
    @length = length
    @rating = rating
  end


end


lego_batman = Movie.new("Lego Batman", 124, "G")

la_la_land = Movie.new("La La Land", 127, "PG-13")

moonlight = Movie.new("Moonlight", 95, "R")



