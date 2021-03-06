class Testimony < ApplicationRecord
  belongs_to :user
  has_many :assignments, dependent: :destroy
  has_many :tags, through: :assignments

  validates :title, presence: true, uniqueness: true
end
