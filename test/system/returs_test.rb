require "application_system_test_case"

class RetursTest < ApplicationSystemTestCase
  setup do
    @retur = returs(:one)
  end

  test "visiting the index" do
    visit returs_url
    assert_selector "h1", text: "Returs"
  end

  test "creating a Retur" do
    visit returs_url
    click_on "New Retur"

    fill_in "Asal gudang", with: @retur.asal_gudang
    fill_in "Dokumen retur", with: @retur.dokumen_retur
    fill_in "Gudang pembelian", with: @retur.gudang_pembelian
    fill_in "Jenis penerimaan", with: @retur.jenis_penerimaan
    fill_in "Jenis pengeluaran", with: @retur.jenis_pengeluaran
    fill_in "Keterangan retur", with: @retur.keterangan_retur
    fill_in "Kode proyek", with: @retur.kode_proyek
    fill_in "Nama inputer", with: @retur.nama_inputer
    fill_in "Nama proyek", with: @retur.nama_proyek
    fill_in "Nomor pengeluaran", with: @retur.nomor_pengeluaran
    click_on "Create Retur"

    assert_text "Retur was successfully created"
    click_on "Back"
  end

  test "updating a Retur" do
    visit returs_url
    click_on "Edit", match: :first

    fill_in "Asal gudang", with: @retur.asal_gudang
    fill_in "Dokumen retur", with: @retur.dokumen_retur
    fill_in "Gudang pembelian", with: @retur.gudang_pembelian
    fill_in "Jenis penerimaan", with: @retur.jenis_penerimaan
    fill_in "Jenis pengeluaran", with: @retur.jenis_pengeluaran
    fill_in "Keterangan retur", with: @retur.keterangan_retur
    fill_in "Kode proyek", with: @retur.kode_proyek
    fill_in "Nama inputer", with: @retur.nama_inputer
    fill_in "Nama proyek", with: @retur.nama_proyek
    fill_in "Nomor pengeluaran", with: @retur.nomor_pengeluaran
    click_on "Update Retur"

    assert_text "Retur was successfully updated"
    click_on "Back"
  end

  test "destroying a Retur" do
    visit returs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Retur was successfully destroyed"
  end
end
