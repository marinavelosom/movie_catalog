class Actor < ApplicationRecord
  validates :name, :birth_year, :email, presence: true
  validates :email, uniqueness: true
  validates :birth_year, comparison: { greater_than: 0, less_than_or_equal_to: Date.today.year }
end
