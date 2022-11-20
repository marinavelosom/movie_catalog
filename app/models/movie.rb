class Movie < ApplicationRecord
    has_many :casts, dependent: :destroy
    has_many :actors, through: :casts

    validates :title, :release_year, presence: true
    validates :title, uniqueness: { case_sensitive: false }
    validates :release_year, comparison: { greater_than: 0, less_than_or_equal_to: Date.today.year }
    validate :actors_cannot_be_empty

    def actors_cannot_be_empty
        errors.add(:actors, "must be selected") if self.actors.empty?
    end
end
