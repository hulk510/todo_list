class List < ApplicationRecord
	has_many :tasks, dependent: :destroy
	validates :title, presence: true, uniqueness: true, length: { maximum: 31 }
end
