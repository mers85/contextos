class Context < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :information_posts, dependent: :destroy
  validates :category_id,  presence: true
  validates :title,  presence: true,
                     length: { minimum: 5 }
end
