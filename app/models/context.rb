class Context < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :information_posts, dependent: :destroy
  has_many :favourites
  #has_many :favourited_by, through: :favourites,  class_name: "User", foreign_key: "user_id"
  validates :category_id,  presence: true
  validates :title,  presence: true,
                     length: { minimum: 5 }


  def favourited?(user)
    user.favourite_for self
  end

  def favourite!(user)
    favourite = user.favourites.build(context_id: self.id)
    favourite.save!
  end

  def unfavourite!(user)
    unfavourite = user.favourite_for(self)
    unfavourite.destroy!
  end


end
