require "application_system_test_case"

class SubTasksTest < ApplicationSystemTestCase
  setup do
    @sub_task = sub_tasks(:one)
  end

  test "visiting the index" do
    visit sub_tasks_url
    assert_selector "h1", text: "Sub tasks"
  end

  test "should create sub task" do
    visit sub_tasks_url
    click_on "New sub task"

    fill_in "Activity date", with: @sub_task.activity_date
    fill_in "Actual hour", with: @sub_task.actual_hour
    fill_in "Actual minute", with: @sub_task.actual_minute
    fill_in "Description", with: @sub_task.description
    fill_in "Official documentation", with: @sub_task.official_documentation
    fill_in "Planned hour", with: @sub_task.planned_hour
    fill_in "Planned minute", with: @sub_task.planned_minute
    fill_in "Task", with: @sub_task.task_id
    fill_in "Task timing", with: @sub_task.task_timing
    fill_in "Video link", with: @sub_task.video_link
    click_on "Create Sub task"

    assert_text "Sub task was successfully created"
    click_on "Back"
  end

  test "should update Sub task" do
    visit sub_task_url(@sub_task)
    click_on "Edit this sub task", match: :first

    fill_in "Activity date", with: @sub_task.activity_date
    fill_in "Actual hour", with: @sub_task.actual_hour
    fill_in "Actual minute", with: @sub_task.actual_minute
    fill_in "Description", with: @sub_task.description
    fill_in "Official documentation", with: @sub_task.official_documentation
    fill_in "Planned hour", with: @sub_task.planned_hour
    fill_in "Planned minute", with: @sub_task.planned_minute
    fill_in "Task", with: @sub_task.task_id
    fill_in "Task timing", with: @sub_task.task_timing
    fill_in "Video link", with: @sub_task.video_link
    click_on "Update Sub task"

    assert_text "Sub task was successfully updated"
    click_on "Back"
  end

  test "should destroy Sub task" do
    visit sub_task_url(@sub_task)
    click_on "Destroy this sub task", match: :first

    assert_text "Sub task was successfully destroyed"
  end
end
