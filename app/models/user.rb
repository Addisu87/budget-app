class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :categories, foreign_key: 'author_id', dependent: :destroy
  has_many :purchases, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  def is?(requested_role)
    role == requested_role.to_s
  end
end
