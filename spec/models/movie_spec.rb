require 'rails_helper'

RSpec.describe Movie, type: :model do
  
  actor = Actor.create(name: "some_name", birth_year: 2001, email: "actor@test.com")
  movie = Movie.create(id: 5, title: "some_title", release_year: 2021, actors: [actor])
  movie2 = Movie.create(id: 6, title: "some_title", release_year: 2021, actors: [actor])
  comment = Comment.create(content: "Primeiro comentário", movie_id: movie.id)

  context 'validations' do
    
    it "is not valid without title" do
      @movie.title = nil
      expect(@movie).to_not be_valid
    end

    it "is not valid without title" do
      @movie.title = 'título'
      @movie2.title = 'título'
      
      expect(@movie).to be_valid
      expect(@movie2).to_not be_valid
    end

    it "is not valid without an actor" do
      @movie.actor = nil
      expect(@movie).to_not be_valid
    end

  end

end
