module SubTasksHelper
  def get_target_hours
    today = Date.today
    if today.saturday? || today.sunday?
      "4 hrs"
    else
      "2 hrs"
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
      elsif get_achieved >= 1 && get_achieved < 4
        "badge text-bg-warning"
      elsif get_achieved >= 4
        "badge text-bg-success"
      end
    else
      if get_achieved == 0.0
        "badge text-bg-danger"
      elsif get_achieved >= 1 && get_achieved < 2
        "badge text-bg-warning"
      elsif get_achieved >= 2
        "badge text-bg-success"
      end
    end
  end
end
