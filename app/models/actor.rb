class Actor < ApplicationRecord
  has_many :casts, dependent: :destroy
  has_many :movies, through: :casts

  validates :name, :birth_year, :email, presence: true
  validates :email, uniqueness: true
  validates :birth_year, comparison: { greater_than: 0, less_than_or_equal_to: Date.today.year }
end
