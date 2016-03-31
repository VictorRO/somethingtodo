class TodoItem < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :todo, -> { where(done: false) }
  scope :done, -> { where(done: true) }
end
