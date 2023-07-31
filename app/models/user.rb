class User < ApplicationRecord
  has_many :reviews, through: :movies
end
