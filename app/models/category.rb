class Category < ApplicationRecord

  has_many :contexts
  validates :name, presence: true
end
