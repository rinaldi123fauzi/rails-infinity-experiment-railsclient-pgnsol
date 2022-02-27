require "application_system_test_case"

class ExpenditureItemsTest < ApplicationSystemTestCase
  setup do
    @sale_item = expenditure_items(:one)
  end

  test "visiting the index" do
    visit expenditure_items_url
    assert_selector "h1", text: "Expenditure Items"
  end

  test "creating a Expenditure item" do
    visit expenditure_items_url
    click_on "New Expenditure Item"

    fill_in "Expenditure", with: @sale_item.expenditure_id
    fill_in "Item", with: @sale_item.item_id
    fill_in "Jumlah keluar", with: @sale_item.jumlah_keluar
    fill_in "Jumlah tersedia", with: @sale_item.jumlah_tersedia
    click_on "Create Expenditure item"

    assert_text "Expenditure item was successfully created"
    click_on "Back"
  end

  test "updating a Expenditure item" do
    visit expenditure_items_url
    click_on "Edit", match: :first

    fill_in "Expenditure", with: @sale_item.expenditure_id
    fill_in "Item", with: @sale_item.item_id
    fill_in "Jumlah keluar", with: @sale_item.jumlah_keluar
    fill_in "Jumlah tersedia", with: @sale_item.jumlah_tersedia
    click_on "Update Expenditure item"

    assert_text "Expenditure item was successfully updated"
    click_on "Back"
  end

  test "destroying a Expenditure item" do
    visit expenditure_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expenditure item was successfully destroyed"
  end
end
