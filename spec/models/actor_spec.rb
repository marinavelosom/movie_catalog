require 'rails_helper'

RSpec.describe Actor, type: :model do
  context "before saving" do
    before(:each) do
      @actor = Actor.new(name: "Um", birth_year: 1990, email: "gustavo@gustavo.com")
    end

    it 'is valid with valid attibutes' do
      expect(@actor).to be_valid
    end

    it "is not valid without name" do
      @actor.name = nil
      expect(@actor).to_not be_valid
    end

    it "is not valid without birth year" do
      @actor.birth_year = nil
      expect(@actor).to_not be_valid
    end

    it "is not valid without email" do
      @actor.email = nil
      expect(@actor).to_not be_valid
    end

    it "is not valid if birth year is lower or equal to 0" do
      @actor.birth_year = 0
      expect(@actor).to_not be_valid

      @actor.birth_year = -1
      expect(@actor).to_not be_valid
    end

    it "is not valid if birth year is greater than current year" do
      @actor.birth_year = Date.today.year + 1
      expect(@actor).to_not be_valid
    end
  end

  context "after saving" do
    before(:each) do
      @actor = Actor.create(name: "Um", birth_year: 1990, email: "teste@teste")
    end

    it "cant be in any movie" do
      expect(@actor.movies).to be_empty
    end

    it "cant create another actor with same email" do
      other_actor = Actor.create(name: "aaa", birth_year: 1, email: @actor.email)

      expect(other_actor).to_not be_valid
      expect(other_actor.errors[:email]).to include("has already been taken")
    end
  end

  context "after created and associated with a movie" do
    before(:each) do
      @actor = Actor.create(name: "Um", birth_year: 1990, email: "teste@teste")
      @movie = Movie.create!(title: "Movie title", release_year: 1990, actors: [@actor])
    end

    it "should list the actor movie" do
      expect(@actor.movies).to eq([@movie])
    end

    it "should remove the reference from actor when the movie is deleted" do
      @movie.destroy
      expect(@actor.movies).to be_empty
    end
  end
end
