class Context < ApplicationRecord
  belongs_to :user
  has_many :information_posts, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
