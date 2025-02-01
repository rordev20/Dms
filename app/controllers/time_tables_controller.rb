class TimeTablesController < ApplicationController
  before_action :set_time_table, only: %i[ show edit update destroy ]
  before_action :set_current_sprint

  # GET /time_tables or /time_tables.json
  def index
    @time_tables = TimeTable.all
  end

  # GET /time_tables/1 or /time_tables/1.json
  def show
  end

  # GET /time_tables/new
  def new
    @time_table = TimeTable.new
  end

  # GET /time_tables/1/edit
  def edit
  end

  # POST /time_tables or /time_tables.json
  def create
    @time_table = TimeTable.new(time_table_params)
    @time_table.sprint_id = @sprint.id

    respond_to do |format|
      if @time_table.save
        format.html { redirect_to @time_table, notice: "Time table was successfully created." }
        format.json { render :show, status: :created, location: @time_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_tables/1 or /time_tables/1.json
  def update
    respond_to do |format|
      if @time_table.update(time_table_params)
        format.html { redirect_to @time_table, notice: "Time table was successfully updated." }
        format.json { render :show, status: :ok, location: @time_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_tables/1 or /time_tables/1.json
  def destroy
    @time_table.destroy

    respond_to do |format|
      format.html { redirect_to time_tables_path, status: :see_other, notice: "Time table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def weekdays
    @time_tables = TimeTable.where(day_type: 1).where(sprint: @sprint)
  end
  
  def weekends
    @time_tables = TimeTable.where(day_type: 2).where(sprint: @sprint)
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_table
      @time_table = TimeTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_table_params
      params.require(:time_table).permit(:sprint_id, :task_id, :description, :planned_hour, :planned_minute, :task_timing, :official_documentation, :video_link, :day_type, :is_active)
    end
end
