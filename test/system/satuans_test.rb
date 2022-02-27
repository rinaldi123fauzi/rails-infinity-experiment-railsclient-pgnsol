require "application_system_test_case"

class SatuansTest < ApplicationSystemTestCase
  setup do
    @satuan = satuans(:one)
  end

  test "visiting the index" do
    visit satuans_url
    assert_selector "h1", text: "Satuans"
  end

  test "creating a Satuan" do
    visit satuans_url
    click_on "New Satuan"

    fill_in "Nama satuan", with: @satuan.nama_satuan
    click_on "Create Satuan"

    assert_text "Satuan was successfully created"
    click_on "Back"
  end

  test "updating a Satuan" do
    visit satuans_url
    click_on "Edit", match: :first

    fill_in "Nama satuan", with: @satuan.nama_satuan
    click_on "Update Satuan"

    assert_text "Satuan was successfully updated"
    click_on "Back"
  end

  test "destroying a Satuan" do
    visit satuans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Satuan was successfully destroyed"
  end
end
