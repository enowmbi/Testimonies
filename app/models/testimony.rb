class Testimony < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :tags, through: :assignments
end
