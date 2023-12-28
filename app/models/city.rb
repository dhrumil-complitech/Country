class City < ApplicationRecord
  belongs_to :country
  belongs_to :state
  validates :name, presence: true,  uniqueness: { case_sensitive: false }, length: { minimum: 2}
  validates :zip, presence: true, length: { minimum: 5, maximum: 6}
  validates :population, presence: true
end
