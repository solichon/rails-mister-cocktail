class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :doses
  # not necessary here
  # has_many :cocktails, through: :doses

end
