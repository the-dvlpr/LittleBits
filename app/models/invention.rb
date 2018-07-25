class Invention < ApplicationRecord
  belongs_to :user
  has_many :bits
  has_many :materials
end