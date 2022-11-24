require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    actor = Actor.create(name: "some_name", birth_year: 2001, email: "actor@test.com")
    movie = Movie.create(id: 5, title: "some_title", release_year: 2021, actors: [actor])

    it 'is valid with valid attibutes' do
      comment = Comment.new(content: "Primeiro comentário", movie_id: movie.id)
      expect(comment).to be_valid
    end

    it 'not is valid without text' do
      comment = Comment.new(movie_id: movie.id)
      expect(comment).to_not be_valid
    end

    it 'not is valid without movie' do
      comment = Comment.new(content: "Primeiro comentário") #ou seja a validação do model está funcionando
      expect(comment).to_not be_valid
    end

    it 'not valid if text blank' do 
      comment = Comment.new(content: nil) 
      expect(comment).to_not be_valid
    end
    
    it 'not valid if movie blank' do 
      comment = Comment.new(movie_id: nil) 
      expect(comment).to_not be_valid
    end
  end

  context 'for log validations' do
    it 'not at approved' do
      comment = Comment.new(aprove: false)
      expect(comment.aprove).to eq(false)
    end

    it 'approved' do
      comment = Comment.new(aprove: true)
      expect(comment.aprove).to eq(true)
    end
  end
end
