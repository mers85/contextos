class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :contexts
  has_many :favourites
  has_many :favourite_contexts, through: :favourites,  source: :context
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
