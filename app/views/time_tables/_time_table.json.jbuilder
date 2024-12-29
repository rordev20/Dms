json.extract! time_table, :id, :task_id, :description, :planned_hour, :planner_min, :task_timing, :official_documentation, :video_link, :activity_date, :day_type, :is_active, :created_at, :updated_at
json.url time_table_url(time_table, format: :json)
