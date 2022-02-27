require "application_system_test_case"

class PengeluaranApprovalsTest < ApplicationSystemTestCase
  setup do
    @pengeluaran_approval = pengeluaran_approvals(:one)
  end

  test "visiting the index" do
    visit pengeluaran_approvals_url
    assert_selector "h1", text: "Pengeluaran Approvals"
  end

  test "creating a Pengeluaran approval" do
    visit pengeluaran_approvals_url
    click_on "New Pengeluaran Approval"

    fill_in "Role", with: @pengeluaran_approval.role_id
    fill_in "Sale", with: @pengeluaran_approval.sale_id
    fill_in "Status", with: @pengeluaran_approval.status_id
    fill_in "User", with: @pengeluaran_approval.user_id
    click_on "Create Pengeluaran approval"

    assert_text "Pengeluaran approval was successfully created"
    click_on "Back"
  end

  test "updating a Pengeluaran approval" do
    visit pengeluaran_approvals_url
    click_on "Edit", match: :first

    fill_in "Role", with: @pengeluaran_approval.role_id
    fill_in "Sale", with: @pengeluaran_approval.sale_id
    fill_in "Status", with: @pengeluaran_approval.status_id
    fill_in "User", with: @pengeluaran_approval.user_id
    click_on "Update Pengeluaran approval"

    assert_text "Pengeluaran approval was successfully updated"
    click_on "Back"
  end

  test "destroying a Pengeluaran approval" do
    visit pengeluaran_approvals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pengeluaran approval was successfully destroyed"
  end
end
