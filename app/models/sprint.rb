class Sprint < ApplicationRecord
  has_many :time_tables
  has_many :sub_tasks
  validates_uniqueness_of :name
  scope :is_active, -> { where(active: true) }

  def set_active
    Sprint.update_all(active: false)
    self.active = true
    self.save!
  end
end
