class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :checks
  has_many :check_contents, through: :checks, source: :content

  def already_checked?(content)
  	self.checks.exists?(content_id: content.id)
  end

end
