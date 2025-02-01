module SprintsHelper
  def monthly_working_hrs
    SubTask::WEEKDAY_MAX * 22 + SubTask::WEEKEND_MAX * 8
  end
end
