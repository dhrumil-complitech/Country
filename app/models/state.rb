class State < ApplicationRecord
  belongs_to :country
  validates :name, presence: true,  uniqueness: { case_sensitive: false }, length: { minimum: 2}
  validates :capital, presence: true,  uniqueness: { case_sensitive: false }, length: { minimum: 2}
  validates :abbreviation, presence: true,  uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum:5}
  validates :is_active, inclusion: { in: [true, false] } 
    scope :active, -> { where(is_active: true) }
    scope :inactive, -> { where(is_active: false) }
end
