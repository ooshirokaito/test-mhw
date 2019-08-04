class Choice < ApplicationRecord

	has_many :contents, dependent: :destroy
end
