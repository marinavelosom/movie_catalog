require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    # movie = Movie.create(:id => 10, :title => 'some_title', :release_year => 2021)
    movie = Movie.create(id: 5, title: "some_title", release_year: 2021)

    it 'is valid with valid attibutes' do
      p movie.id
      p movie.title
      comment = Comment.new(content: "Primeiro comentário", movie_id: movie.id) 
      p comment
      p comment.valid?
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
      comment.valid?
      expect(comment.errors[:content]).to include("can't be blank")
    end

    it 'not valid if movie blank' do 
      comment = Comment.new(movie_id: movie.id) 
      p comment.movie_id
      expect(comment.errors[:movie_id]).to include("can't be blank")
    end
  end

  context 'for log validations' do
    it 'not at approved' do
      comment = Comment.new
      expect(comment.aprove).to eq(false)
    end

    it 'approved' do
      comment = Comment.new(aprove: true)
      expect(comment.aprove).to eq(true)
    end
  end
end


# validar o texto
# validar o filme