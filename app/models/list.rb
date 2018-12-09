class List < ApplicationRecord
	has_many :tasks, -> { order(created_at: :desc) }, dependent: :destroy
	validates :title, presence: true, uniqueness: true, length: { maximum: 31 }
end
