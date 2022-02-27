require "application_system_test_case"

class MaintenanceAssetsTest < ApplicationSystemTestCase
  setup do
    @maintenance_asset = maintenance_assets(:one)
  end

  test "visiting the index" do
    visit maintenance_assets_url
    assert_selector "h1", text: "Maintenance Assets"
  end

  test "creating a Maintenance asset" do
    visit maintenance_assets_url
    click_on "New Maintenance Asset"

    fill_in "Dokumen pengeluaran", with: @maintenance_asset.dokumen_pengeluaran
    fill_in "Jenis pengeluaran", with: @maintenance_asset.jenis_pengeluaran
    fill_in "Keterangan pengeluaran", with: @maintenance_asset.keterangan_pengeluaran
    fill_in "Kode proyek", with: @maintenance_asset.kode_proyek
    fill_in "Nomor pengeluaran", with: @maintenance_asset.nomor_pengeluaran
    fill_in "Status", with: @maintenance_asset.status_id
    fill_in "Tanggal pengeluaran", with: @maintenance_asset.tanggal_pengeluaran
    fill_in "User", with: @maintenance_asset.user_id
    fill_in "Warehouse", with: @maintenance_asset.warehouse_id
    click_on "Create Maintenance asset"

    assert_text "Maintenance asset was successfully created"
    click_on "Back"
  end

  test "updating a Maintenance asset" do
    visit maintenance_assets_url
    click_on "Edit", match: :first

    fill_in "Dokumen pengeluaran", with: @maintenance_asset.dokumen_pengeluaran
    fill_in "Jenis pengeluaran", with: @maintenance_asset.jenis_pengeluaran
    fill_in "Keterangan pengeluaran", with: @maintenance_asset.keterangan_pengeluaran
    fill_in "Kode proyek", with: @maintenance_asset.kode_proyek
    fill_in "Nomor pengeluaran", with: @maintenance_asset.nomor_pengeluaran
    fill_in "Status", with: @maintenance_asset.status_id
    fill_in "Tanggal pengeluaran", with: @maintenance_asset.tanggal_pengeluaran
    fill_in "User", with: @maintenance_asset.user_id
    fill_in "Warehouse", with: @maintenance_asset.warehouse_id
    click_on "Update Maintenance asset"

    assert_text "Maintenance asset was successfully updated"
    click_on "Back"
  end

  test "destroying a Maintenance asset" do
    visit maintenance_assets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maintenance asset was successfully destroyed"
  end
end
