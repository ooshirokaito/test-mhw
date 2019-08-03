class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :checks, dependent: :destroy

  validates :name, presence: true
  validates :passcode, presence: true

  def password_required?
 	false
  end

end
