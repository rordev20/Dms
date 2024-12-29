require "application_system_test_case"

class PunchesTest < ApplicationSystemTestCase
  setup do
    @punch = punches(:one)
  end

  test "visiting the index" do
    visit punches_url
    assert_selector "h1", text: "Punches"
  end

  test "should create punch" do
    visit punches_url
    click_on "New punch"

    fill_in "Punch in", with: @punch.punch_in
    fill_in "Punch out", with: @punch.punch_out
    fill_in "Sub task", with: @punch.sub_task_id
    click_on "Create Punch"

    assert_text "Punch was successfully created"
    click_on "Back"
  end

  test "should update Punch" do
    visit punch_url(@punch)
    click_on "Edit this punch", match: :first

    fill_in "Punch in", with: @punch.punch_in
    fill_in "Punch out", with: @punch.punch_out
    fill_in "Sub task", with: @punch.sub_task_id
    click_on "Update Punch"

    assert_text "Punch was successfully updated"
    click_on "Back"
  end

  test "should destroy Punch" do
    visit punch_url(@punch)
    click_on "Destroy this punch", match: :first

    assert_text "Punch was successfully destroyed"
  end
end
