require "test_helper"

class TimeTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_table = time_tables(:one)
  end

  test "should get index" do
    get time_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_time_table_url
    assert_response :success
  end

  test "should create time_table" do
    assert_difference("TimeTable.count") do
      post time_tables_url, params: { time_table: { activity_date: @time_table.activity_date, day_type: @time_table.day_type, description: @time_table.description, is_active: @time_table.is_active, official_documentation: @time_table.official_documentation, planned_hour: @time_table.planned_hour, planner_min: @time_table.planner_min, task_id: @time_table.task_id, task_timing: @time_table.task_timing, video_link: @time_table.video_link } }
    end

    assert_redirected_to time_table_url(TimeTable.last)
  end

  test "should show time_table" do
    get time_table_url(@time_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_table_url(@time_table)
    assert_response :success
  end

  test "should update time_table" do
    patch time_table_url(@time_table), params: { time_table: { activity_date: @time_table.activity_date, day_type: @time_table.day_type, description: @time_table.description, is_active: @time_table.is_active, official_documentation: @time_table.official_documentation, planned_hour: @time_table.planned_hour, planner_min: @time_table.planner_min, task_id: @time_table.task_id, task_timing: @time_table.task_timing, video_link: @time_table.video_link } }
    assert_redirected_to time_table_url(@time_table)
  end

  test "should destroy time_table" do
    assert_difference("TimeTable.count", -1) do
      delete time_table_url(@time_table)
    end

    assert_redirected_to time_tables_url
  end
end
