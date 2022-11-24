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
      comment = Comment.new(content: "Comentário") 
      expect(comment).to_not be_valid
    end
  end

  context 'if was approved' do
    it 'not at approved' do
      expect(comment.aprove).to eq(false)
    end
  end

  context 'after saving' do
    it 'approved' do
      comment = Comment.update(aprove: true)
      log = Log.all
      expect(log).to_not be_empty
    end
  end
end
