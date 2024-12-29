json.extract! task, :id, :name, :description, :official_documentation, :video_link, :is_active, :created_at, :updated_at
json.url task_url(task, format: :json)
