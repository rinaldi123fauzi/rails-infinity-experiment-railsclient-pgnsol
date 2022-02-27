require "application_system_test_case"

class MaterialsTest < ApplicationSystemTestCase
  setup do
    @item = materials(:one)
  end

  test "visiting the index" do
    visit materials_url
    assert_selector "h1", text: "Materials"
  end

  test "creating a Item" do
    visit materials_url
    click_on "New Item"

    fill_in "Nama material", with: @item.nama_material
    fill_in "Satuan", with: @item.satuan
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit materials_url
    click_on "Edit", match: :first

    fill_in "Nama material", with: @item.nama_material
    fill_in "Satuan", with: @item.satuan
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
