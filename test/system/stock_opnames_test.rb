require "application_system_test_case"

class StockOpnamesTest < ApplicationSystemTestCase
  setup do
    @stock_opname = stock_opnames(:one)
  end

  test "visiting the index" do
    visit stock_opnames_url
    assert_selector "h1", text: "Stock Opnames"
  end

  test "creating a Stock opname" do
    visit stock_opnames_url
    click_on "New Stock Opname"

    fill_in "Item", with: @stock_opname.item_id
    fill_in "Jumlah fisik", with: @stock_opname.jumlah_fisik
    fill_in "Jumlah tersedia", with: @stock_opname.jumlah_tersedia
    fill_in "Keterangan", with: @stock_opname.keterangan
    fill_in "Kode qr code", with: @stock_opname.kode_qr_code
    fill_in "Lokasi penempatan", with: @stock_opname.lokasi_penempatan
    fill_in "Measurement", with: @stock_opname.measurement_id
    fill_in "Selisih", with: @stock_opname.selisih
    fill_in "Tanggal", with: @stock_opname.tanggal
    fill_in "Warehouse", with: @stock_opname.warehouse_id
    click_on "Create Stock opname"

    assert_text "Stock opname was successfully created"
    click_on "Back"
  end

  test "updating a Stock opname" do
    visit stock_opnames_url
    click_on "Edit", match: :first

    fill_in "Item", with: @stock_opname.item_id
    fill_in "Jumlah fisik", with: @stock_opname.jumlah_fisik
    fill_in "Jumlah tersedia", with: @stock_opname.jumlah_tersedia
    fill_in "Keterangan", with: @stock_opname.keterangan
    fill_in "Kode qr code", with: @stock_opname.kode_qr_code
    fill_in "Lokasi penempatan", with: @stock_opname.lokasi_penempatan
    fill_in "Measurement", with: @stock_opname.measurement_id
    fill_in "Selisih", with: @stock_opname.selisih
    fill_in "Tanggal", with: @stock_opname.tanggal
    fill_in "Warehouse", with: @stock_opname.warehouse_id
    click_on "Update Stock opname"

    assert_text "Stock opname was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock opname" do
    visit stock_opnames_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock opname was successfully destroyed"
  end
end
