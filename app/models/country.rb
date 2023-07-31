class Country < ApplicationRecord
  has_many :filming_locations
  has_many :movies
end
