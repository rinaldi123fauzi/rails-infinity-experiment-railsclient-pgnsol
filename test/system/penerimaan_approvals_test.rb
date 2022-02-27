require "application_system_test_case"

class ReceiveHistorysTest < ApplicationSystemTestCase
  setup do
    @receive_history = receive_histories(:one)
  end

  test "visiting the index" do
    visit penerimaan_approvals_url
    assert_selector "h1", text: "Penerimaan Approvals"
  end

  test "creating a Penerimaan approval" do
    visit penerimaan_approvals_url
    click_on "New Penerimaan Approval"

    fill_in "Catatan penerimaan", with: @receive_history.catatan_penerimaan
    fill_in "Receive", with: @receive_history.receive_id
    fill_in "Role", with: @receive_history.role_id
    fill_in "Status", with: @receive_history.status_id
    fill_in "User", with: @receive_history.user_id
    click_on "Create Penerimaan approval"

    assert_text "Penerimaan approval was successfully created"
    click_on "Back"
  end

  test "updating a Penerimaan approval" do
    visit penerimaan_approvals_url
    click_on "Edit", match: :first

    fill_in "Catatan penerimaan", with: @receive_history.catatan_penerimaan
    fill_in "Receive", with: @receive_history.receive_id
    fill_in "Role", with: @receive_history.role_id
    fill_in "Status", with: @receive_history.status_id
    fill_in "User", with: @receive_history.user_id
    click_on "Update Penerimaan approval"

    assert_text "Penerimaan approval was successfully updated"
    click_on "Back"
  end

  test "destroying a Penerimaan approval" do
    visit penerimaan_approvals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Penerimaan approval was successfully destroyed"
  end
end
