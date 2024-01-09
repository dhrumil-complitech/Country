class City < ApplicationRecord
  belongs_to :country
  belongs_to :state
  validates :name, presence: true,  uniqueness: { case_sensitive: false }, length: { minimum: 2}
  validates :zip, presence: true, length: { minimum: 5, maximum: 6}
  validates :population, presence: true

  require 'csv'
def self.to_csv
 posts = all
 CSV.generate do |csv|
   csv << column_names
   posts.each do |post|
     csv << post.attributes.values_at(*column_names)
   end
 end
end
end
