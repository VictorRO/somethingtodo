class Task < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :high, -> { where(priority: 'high') }
  scope :normal, -> { where(priority: 'normal') }
  scope :low, -> { where(priority: 'low') }
end
