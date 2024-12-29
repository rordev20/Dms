class SubTask < ApplicationRecord
  belongs_to :task
  belongs_to :sprint

  before_save :set_value_from_parent_if_blank


  def set_value_from_parent_if_blank
    task = self.task
    if task.present?
      self.description = task.description
      self.official_documentation = task.official_documentation
      self.video_link = task.video_link
      self.sprint = Sprint.is_active.last
    end  
  end  
end
