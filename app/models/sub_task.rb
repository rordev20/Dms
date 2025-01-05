class SubTask < ApplicationRecord
  belongs_to :task
  belongs_to :sprint

  before_save :set_value_from_parent_if_blank

  WEEKDAY_MIN = 1
  WEEKDAY_MAX = 2
  WEEKEND_MIN = 2
  WEEKEND_MAX = 4



  def set_value_from_parent_if_blank
    task = self.task
    if task.present?
      self.description ||= task.description
      self.official_documentation = task.official_documentation
      self.video_link = task.video_link
      self.sprint = Sprint.is_active.last
    end  
  end  
end
