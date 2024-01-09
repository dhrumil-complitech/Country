class Country < ApplicationRecord
    has_many :states, dependent: :destroy 
    has_many :cities, dependent: :destroy
    validates :name, presence: true,  uniqueness: { case_sensitive: false }, length: { minimum: 2}
    validates :code, presence: true, uniqueness: {case_sensitive: false }, length:{minimum: 2, maximum: 5 }
    validates :is_active, inclusion: { in: [true, false] } 
    scope :active, -> { where(is_active: true) }
    scope :inactive, -> { where(is_active: false) }

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

def self.import_from_csv(file)
  CSV.foreach(file.path, headers: true) do |row|
    country_attributes = {}
    
    row.to_hash.each do |key, value|
      if Country.column_names.include?(key.downcase) 
        country_attributes[key.downcase.to_sym] = value
      end
    end
    country = find_or_initialize_by(code: country_attributes[:code])
    country.update(country_attributes)
    country.save!
  end
end


end
