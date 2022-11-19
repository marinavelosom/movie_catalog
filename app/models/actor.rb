class Actor < ApplicationRecord
  validates :name, :birth_year, :email, presence: true
  validates :email, uniqueness: true
end
