class Picture < ApplicationRecord
  belongs_to :context
  has_one_attached :image
end
