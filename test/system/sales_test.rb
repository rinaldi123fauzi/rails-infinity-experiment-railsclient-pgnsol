require "application_system_test_case"

class ExpendituresTest < ApplicationSystemTestCase
  setup do
    @sale = expenditures(:one)
  end

  test "visiting the index" do
    visit expenditures_url
    assert_selector "h1", text: "Expenditures"
  end

  test "creating a Expenditure" do
    visit expenditures_url
    click_on "New Expenditure"

    fill_in "Jenis pengeluaran", with: @sale.jenis_pengeluaran
    fill_in "Keperluan pengeluaran", with: @sale.keperluan_pengeluaran
    fill_in "Nomor pengeluaran", with: @sale.nomor_pengeluaran
    fill_in "Status", with: @sale.status_id
    fill_in "Tanggal pengeluaran", with: @sale.tanggal_pengeluaran
    fill_in "User", with: @sale.user_id
    fill_in "Warehouse", with: @sale.warehouse_id
    click_on "Create Expenditure"

    assert_text "Expenditure was successfully created"
    click_on "Back"
  end

  test "updating a Expenditure" do
    visit expenditures_url
    click_on "Edit", match: :first

    fill_in "Jenis pengeluaran", with: @sale.jenis_pengeluaran
    fill_in "Keperluan pengeluaran", with: @sale.keperluan_pengeluaran
    fill_in "Nomor pengeluaran", with: @sale.nomor_pengeluaran
    fill_in "Status", with: @sale.status_id
    fill_in "Tanggal pengeluaran", with: @sale.tanggal_pengeluaran
    fill_in "User", with: @sale.user_id
    fill_in "Warehouse", with: @sale.warehouse_id
    click_on "Update Expenditure"

    assert_text "Expenditure was successfully updated"
    click_on "Back"
  end

  test "destroying a Expenditure" do
    visit expenditures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expenditure was successfully destroyed"
  end
end
