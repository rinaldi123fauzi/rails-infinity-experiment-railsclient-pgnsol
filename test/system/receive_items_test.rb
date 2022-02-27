require "application_system_test_case"

class ReceiveItemsTest < ApplicationSystemTestCase
  setup do
    @receive_item = receive_items(:one)
  end

  test "visiting the index" do
    visit receive_items_url
    assert_selector "h1", text: "Receive Items"
  end

  test "creating a Receive item" do
    visit receive_items_url
    click_on "New Receive Item"

    fill_in "Item", with: @receive_item.item_id
    fill_in "Receive", with: @receive_item.receive_id
    click_on "Create Receive item"

    assert_text "Receive item was successfully created"
    click_on "Back"
  end

  test "updating a Receive item" do
    visit receive_items_url
    click_on "Edit", match: :first

    fill_in "Item", with: @receive_item.item_id
    fill_in "Receive", with: @receive_item.receive_id
    click_on "Update Receive item"

    assert_text "Receive item was successfully updated"
    click_on "Back"
  end

  test "destroying a Receive item" do
    visit receive_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receive item was successfully destroyed"
  end
end
