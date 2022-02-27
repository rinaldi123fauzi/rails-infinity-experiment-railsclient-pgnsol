require "application_system_test_case"

class SaleApprovalsTest < ApplicationSystemTestCase
  setup do
    @sale_history = sale_histories(:one)
  end

  test "visiting the index" do
    visit sale_approvals_url
    assert_selector "h1", text: "Sale Approvals"
  end

  test "creating a Sale approval" do
    visit sale_approvals_url
    click_on "New Sale Approval"

    fill_in "Catatan penjualan", with: @sale_history.catatan_penjualan
    fill_in "Sale", with: @sale_history.sale_id
    fill_in "Status", with: @sale_history.status_id
    fill_in "User", with: @sale_history.user_id
    click_on "Create Sale approval"

    assert_text "Sale approval was successfully created"
    click_on "Back"
  end

  test "updating a Sale approval" do
    visit sale_approvals_url
    click_on "Edit", match: :first

    fill_in "Catatan penjualan", with: @sale_history.catatan_penjualan
    fill_in "Sale", with: @sale_history.sale_id
    fill_in "Status", with: @sale_history.status_id
    fill_in "User", with: @sale_history.user_id
    click_on "Update Sale approval"

    assert_text "Sale approval was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale approval" do
    visit sale_approvals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale approval was successfully destroyed"
  end
end
