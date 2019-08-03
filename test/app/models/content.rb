class Content < ApplicationRecord
	belongs_to :choice

	has_many :checks, dependent: :destroy
	has_many :checked_users, through: :checks, source: :user
	def checked_by?(user)
		checks.where(user_id: user.id).exists?
	end
end
