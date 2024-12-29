class SubTasksController < ApplicationController
  before_action :set_sub_task, only: %i[ show edit update destroy ]
  before_action :set_current_sprint

  # GET /sub_tasks or /sub_tasks.json
  def index
    today = Date.today
    week_wise_data = []
    all_seven_days = []
    series_temp_data = {}
    @sub_tasks = SubTask.where(sprint: @sprint).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    sub_tasks_in_last_seven_days = SubTask.includes(:task).where('sub_tasks.created_at >= ?', 7.days.ago)
    task_ids = sub_tasks_in_last_seven_days.pluck(:task_id)
    all_task_names = Task.where(id: task_ids).pluck(:name)
    all_task_names.each do |task_name|
      series_temp_data[task_name.to_sym] = []
    end  
    records_by_day = sub_tasks_in_last_seven_days.group_by { |record| record.created_at.to_date }
    records_by_day.each do |date, records_on_day|
      records_on_day.each do |per_record|
        duration = per_record.actual_hour.to_f + per_record.actual_minute.to_f / 60
        week_wise_data << {
          day: Date.parse(date.to_s).strftime("%A"),
          name: per_record.task.name.to_sym,
          duration: duration
        }
      end
    end
    last_7_days = (0..6).map { |i| today - i }
    last_7_days.each do |date|
      all_seven_days << Date.parse(date.to_s).strftime("%A")
    end 
    @all_seven_days = all_seven_days.reverse
    week_wise_data
    @all_seven_days.each do |week_day|
      week_date_data = week_wise_data.select {|wwd| wwd[:day] == week_day}
      series_temp_data.each do |task, data|
        task_work_hour = week_date_data.select {|wdd| wdd[:name] == task}.map {|wdd| wdd[:duration]}.sum
        series_temp_data[task] << task_work_hour
      end
    end
    @series_data = series_temp_data.map {|key, value| {name: key, data: value}}
  end

  # GET /sub_tasks/1 or /sub_tasks/1.json
  def show
  end

  # GET /sub_tasks/new
  def new
    @sub_task = SubTask.new
  end

  # GET /sub_tasks/1/edit
  def edit
  end

  # POST /sub_tasks or /sub_tasks.json
  def create
    @sub_task = SubTask.new(sub_task_params)

    respond_to do |format|
      if @sub_task.save
        format.html { redirect_to @sub_task, notice: "Sub task was successfully created." }
        format.json { render :show, status: :created, location: @sub_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_tasks/1 or /sub_tasks/1.json
  def update
    respond_to do |format|
      if @sub_task.update(sub_task_params)
        format.html { redirect_to @sub_task, notice: "Sub task was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_tasks/1 or /sub_tasks/1.json
  def destroy
    @sub_task.destroy

    respond_to do |format|
      format.html { redirect_to sub_tasks_path, status: :see_other, notice: "Sub task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def sync_default_for_today

    unless SubTask.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).exists?
      today = Date.today
      if today.saturday? || today.sunday? 
        @time_tables = TimeTable.where(day_type: 2).where(sprint: @sprint)
      else
        @time_tables = TimeTable.where(day_type: 1).where(sprint: @sprint)
      end
      @time_tables.each do |time_table|
         st = SubTask.new
         st.task_id = time_table.task_id
         st.sprint_id = time_table.sprint_id
         st.description = time_table.description
         st.planned_hour = time_table.planned_hour
         st.planned_minute = time_table.planned_minute
         st.task_timing = time_table.task_timing
         st.official_documentation = time_table.official_documentation
         st.video_link = time_table.video_link
         st.save!
      end
      redirect_to sub_tasks_path, status: :see_other, notice: "Sub task was successfully synced"
    else
      redirect_to sub_tasks_path, status: :see_other, notice: "Task already exists cannot sync" 
    end  
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_task
      @sub_task = SubTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_task_params
      params.require(:sub_task).permit(:sprint_id, :task_id, :description, :planned_hour, :planned_minute, :task_timing, :actual_hour, :actual_minute, :official_documentation, :video_link, :activity_date)
    end
end
