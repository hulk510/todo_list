class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true, length: { maximum: 31 }
  validates :list_id, presence: true, uniqueness: {scope: [:title]}
  default_scope -> { order(created_at: :desc) }
  scope :finished, -> { where(done: true) }
  scope :unfinished, -> { where(done: false) }
  scope :near_deadline, -> { where.not("deadline >= ?", Date.today())}
end
