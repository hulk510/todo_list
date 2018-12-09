class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true, length: { maximum: 31 }, uniqueness: {scope: [:list_id]}
  validates :list_id, presence: true
  scope :finished, -> { where(done: true) }
  scope :unfinished, -> { where(done: false) }
  scope :near_deadline, -> { where.not("deadline >= ?", Date.today())}
end
