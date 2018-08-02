class Favourite < ApplicationRecord
  belongs_to :context
  belongs_to :user
end
