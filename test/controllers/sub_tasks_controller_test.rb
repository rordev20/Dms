require "test_helper"

class SubTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_task = sub_tasks(:one)
  end

  test "should get index" do
    get sub_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_task_url
    assert_response :success
  end

  test "should create sub_task" do
    assert_difference("SubTask.count") do
      post sub_tasks_url, params: { sub_task: { activity_date: @sub_task.activity_date, actual_hour: @sub_task.actual_hour, actual_minute: @sub_task.actual_minute, description: @sub_task.description, official_documentation: @sub_task.official_documentation, planned_hour: @sub_task.planned_hour, planned_minute: @sub_task.planned_minute, task_id: @sub_task.task_id, task_timing: @sub_task.task_timing, video_link: @sub_task.video_link } }
    end

    assert_redirected_to sub_task_url(SubTask.last)
  end

  test "should show sub_task" do
    get sub_task_url(@sub_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_task_url(@sub_task)
    assert_response :success
  end

  test "should update sub_task" do
    patch sub_task_url(@sub_task), params: { sub_task: { activity_date: @sub_task.activity_date, actual_hour: @sub_task.actual_hour, actual_minute: @sub_task.actual_minute, description: @sub_task.description, official_documentation: @sub_task.official_documentation, planned_hour: @sub_task.planned_hour, planned_minute: @sub_task.planned_minute, task_id: @sub_task.task_id, task_timing: @sub_task.task_timing, video_link: @sub_task.video_link } }
    assert_redirected_to sub_task_url(@sub_task)
  end

  test "should destroy sub_task" do
    assert_difference("SubTask.count", -1) do
      delete sub_task_url(@sub_task)
    end

    assert_redirected_to sub_tasks_url
  end
end
