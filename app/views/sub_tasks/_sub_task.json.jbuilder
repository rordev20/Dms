json.extract! sub_task, :id, :task_id, :description, :planned_hour, :planned_minute, :task_timing, :actual_hour, :actual_minute, :official_documentation, :video_link, :activity_date, :created_at, :updated_at
json.url sub_task_url(sub_task, format: :json)
