class Task < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true, uniqueness: true

  scope :high, -> { where(priority: 'high') }
  scope :normal, -> { where(priority: 'normal') }
  scope :low, -> { where(priority: 'low') }
  scope :from_today, -> { where(completed_at: [Time.zone.now.midnight..(Time.zone.now.midnight + 1.day), nil])}
end
