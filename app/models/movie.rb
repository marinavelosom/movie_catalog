class Movie < ApplicationRecord
   
    validates :title, presence: true
    validates :title, uniqueness: { case_sensitive: false }
    validates :releaseDate, presence: true

end
