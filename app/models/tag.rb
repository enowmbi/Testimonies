class Tag < ApplicationRecord
  has_many :assignments
  has_many :testimonies, through: :assignments
end
