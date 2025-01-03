require "test_helper"

class PunchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @punch = punches(:one)
  end

  test "should get index" do
    get punches_url
    assert_response :success
  end

  test "should get new" do
    get new_punch_url
    assert_response :success
  end

  test "should create punch" do
    assert_difference("Punch.count") do
      post punches_url, params: { punch: { punch_in: @punch.punch_in, punch_out: @punch.punch_out, sub_task_id: @punch.sub_task_id } }
    end

    assert_redirected_to punch_url(Punch.last)
  end

  test "should show punch" do
    get punch_url(@punch)
    assert_response :success
  end

  test "should get edit" do
    get edit_punch_url(@punch)
    assert_response :success
  end

  test "should update punch" do
    patch punch_url(@punch), params: { punch: { punch_in: @punch.punch_in, punch_out: @punch.punch_out, sub_task_id: @punch.sub_task_id } }
    assert_redirected_to punch_url(@punch)
  end

  test "should destroy punch" do
    assert_difference("Punch.count", -1) do
      delete punch_url(@punch)
    end

    assert_redirected_to punches_url
  end
end
