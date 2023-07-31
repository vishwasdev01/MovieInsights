class Movie < ApplicationRecord
  has_and_belongs_to_many :actors 
  belongs_to :country
  has_many :reviews
end
