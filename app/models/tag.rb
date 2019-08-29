class Tag < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :testimonies, through: :assignments

  validates :name, presence: true, uniqueness: true
end
