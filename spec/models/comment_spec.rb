require 'rails_helper'

RSpec.describe Comment, type: :model do
  actor = Actor.create(name: "some_name", birth_year: 2001, email: "actor@test.com")
  movie = Movie.create(id: 5, title: "some_title", release_year: 2021, actors: [actor])
  comment = Comment.create(content: "Primeiro comentário", movie_id: movie.id)

  context 'validations' do
    it 'is valid with valid attibutes' do
      expect(comment).to be_valid
    end
    
    it 'not is valid without text' do
      comment = Comment.new(movie_id: movie.id)
      expect(comment).to_not be_valid
    end

    it 'not is valid without movie' do
      comment = Comment.new(content: "") 
      expect(comment).to_not be_valid
    end
  end
  
  context 'after saving' do
    it 'not approved' do
      log = Log.find_by(comment:comment)
      expect(log).to be_nil
    end

    it 'approved' do
      comment = Comment.update(aprove: true)
      log = Log.find_by(comment:comment)
      expect(log).to_not be_nil
    end

    it 'movies' do
      comment = Comment.new(content: "lorem", movie_id: movie.id)
      expect(comment_movie:movie).to_not be_empty
    end
  end
end
