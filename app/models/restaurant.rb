class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CATEGORIES = ["Category 1", "Category 2", "Category 3"].freeze
end
