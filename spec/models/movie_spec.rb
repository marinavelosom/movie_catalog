require 'rails_helper'

RSpec.describe Movie, type: :model do
  
  actor = Actor.create(name: "nome", birth_year: 2001, email: "ator@gmail.com")
  movie = Movie.create(id: 5, title: "titulo", release_year: 2021, actors: [actor])
  movie2 = Movie.create(id: 6, title: "titulo2", release_year: 2021, actors: [actor])
 

  context 'validations' do
    
    it "is not valid without title" do
      movie.title = nil
      expect(movie).to_not be_valid
    end

    it "is not valid with the same title" do
      movie.title = "Test"
      movie2.title = "Test"
      expect(movie).to be_valid
      expect(movie2).to_not be_valid
    end

    it "is not valid without an actor" do
      movie.actors = nil
      expect(movie).to_not be_valid
    end

  end

end
