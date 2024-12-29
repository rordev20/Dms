require "application_system_test_case"

class TimeTablesTest < ApplicationSystemTestCase
  setup do
    @time_table = time_tables(:one)
  end

  test "visiting the index" do
    visit time_tables_url
    assert_selector "h1", text: "Time tables"
  end

  test "should create time table" do
    visit time_tables_url
    click_on "New time table"

    fill_in "Activity date", with: @time_table.activity_date
    fill_in "Day type", with: @time_table.day_type
    fill_in "Description", with: @time_table.description
    check "Is active" if @time_table.is_active
    fill_in "Official documentation", with: @time_table.official_documentation
    fill_in "Planned hour", with: @time_table.planned_hour
    fill_in "Planner min", with: @time_table.planner_min
    fill_in "Task", with: @time_table.task_id
    fill_in "Task timing", with: @time_table.task_timing
    fill_in "Video link", with: @time_table.video_link
    click_on "Create Time table"

    assert_text "Time table was successfully created"
    click_on "Back"
  end

  test "should update Time table" do
    visit time_table_url(@time_table)
    click_on "Edit this time table", match: :first

    fill_in "Activity date", with: @time_table.activity_date
    fill_in "Day type", with: @time_table.day_type
    fill_in "Description", with: @time_table.description
    check "Is active" if @time_table.is_active
    fill_in "Official documentation", with: @time_table.official_documentation
    fill_in "Planned hour", with: @time_table.planned_hour
    fill_in "Planner min", with: @time_table.planner_min
    fill_in "Task", with: @time_table.task_id
    fill_in "Task timing", with: @time_table.task_timing
    fill_in "Video link", with: @time_table.video_link
    click_on "Update Time table"

    assert_text "Time table was successfully updated"
    click_on "Back"
  end

  test "should destroy Time table" do
    visit time_table_url(@time_table)
    click_on "Destroy this time table", match: :first

    assert_text "Time table was successfully destroyed"
  end
end
