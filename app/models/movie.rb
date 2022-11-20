class Movie < ApplicationRecord
    validates :title, :release_year, presence: true
    validates :title, uniqueness: { case_sensitive: false }
    validates :release_year, comparison: { greater_than: 0, less_than_or_equal_to: Date.today.year }
end
