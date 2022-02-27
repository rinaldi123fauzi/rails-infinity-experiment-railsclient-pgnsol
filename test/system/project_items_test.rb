require "application_system_test_case"

class ProjectItemsTest < ApplicationSystemTestCase
  setup do
    @project_item = project_items(:one)
  end

  test "visiting the index" do
    visit project_items_url
    assert_selector "h1", text: "Project Items"
  end

  test "creating a Project item" do
    visit project_items_url
    click_on "New Project Item"

    fill_in "Item", with: @project_item.item_id
    fill_in "Jenis kode biaya", with: @project_item.jenis_kode_biaya
    fill_in "Jumlah keluar", with: @project_item.jumlah_keluar
    fill_in "Jumlah tersedia", with: @project_item.jumlah_tersedia
    fill_in "Kode proyek", with: @project_item.kode_proyek
    fill_in "Measurement", with: @project_item.measurement_id
    fill_in "Nama proyek", with: @project_item.nama_proyek
    click_on "Create Project item"

    assert_text "Project item was successfully created"
    click_on "Back"
  end

  test "updating a Project item" do
    visit project_items_url
    click_on "Edit", match: :first

    fill_in "Item", with: @project_item.item_id
    fill_in "Jenis kode biaya", with: @project_item.jenis_kode_biaya
    fill_in "Jumlah keluar", with: @project_item.jumlah_keluar
    fill_in "Jumlah tersedia", with: @project_item.jumlah_tersedia
    fill_in "Kode proyek", with: @project_item.kode_proyek
    fill_in "Measurement", with: @project_item.measurement_id
    fill_in "Nama proyek", with: @project_item.nama_proyek
    click_on "Update Project item"

    assert_text "Project item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project item" do
    visit project_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project item was successfully destroyed"
  end
end
