class Dose < ApplicationRecord
  validates :description, presence: true
  validates :ingredient, presence: true, uniqueness: { scope: :cocktail, message: "is already used in this cocktail" }
  validates :cocktail, presence: true

  belongs_to :ingredient
  belongs_to :cocktail

end
