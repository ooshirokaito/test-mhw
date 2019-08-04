class Content < ApplicationRecord
	belongs_to :choice
	has_many :users, through: :checks

end
