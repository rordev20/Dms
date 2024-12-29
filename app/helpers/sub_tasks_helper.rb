module SubTasksHelper
  def get_target_hours
    today = Date.today
    if today.saturday? || today.sunday?
      "#{SubTask::WEEKEND_MAX} hrs"
    else
      "#{SubTask::WEEKDAY_MAX} hrs"
    end
  end

  def get_achieved
    duration = 0
    sub_tasks = SubTask.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    sub_tasks.each do |st|
      duration += st.actual_hour.to_f + st.actual_minute.to_f / 60
    end
    duration.to_f
  end

  def get_achieved_class
    today = Date.today
    if today.saturday? || today.sunday?
      if get_achieved == 0.0
        "badge text-bg-danger"
      elsif get_achieved >= SubTask::WEEKEND_MIN && get_achieved < SubTask::WEEKEND_MAX
        "badge text-bg-warning"
      elsif get_achieved >= SubTask::WEEKEND_MAX
        "badge text-bg-success"
      end
    else
      if get_achieved == 0.0
        "badge text-bg-danger"
      elsif get_achieved >= SubTask::WEEKDAY_MIN && get_achieved < SubTask::WEEKDAY_MAX
        "badge text-bg-warning"
      elsif get_achieved >= SubTask::WEEKDAY_MAX
        "badge text-bg-success"
      end
    end
  end
end
