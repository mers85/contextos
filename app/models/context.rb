class Context < ApplicationRecord
  belongs_to :user
  validates :title, presence: true,
                    length: { minimum: 5 }
end
