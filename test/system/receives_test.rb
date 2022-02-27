require "application_system_test_case"

class ReceivesTest < ApplicationSystemTestCase
  setup do
    @receive = receives(:one)
  end

  test "visiting the index" do
    visit receives_url
    assert_selector "h1", text: "Receives"
  end

  test "creating a Receive" do
    visit receives_url
    click_on "New Receive"

    fill_in "Jenis", with: @receive.jenis
    fill_in "Judul bast", with: @receive.judul_bast
    fill_in "Kode", with: @receive.kode
    fill_in "Kode akun", with: @receive.kode_akun
    fill_in "Nama", with: @receive.nama
    fill_in "Nama penyedia", with: @receive.nama_penyedia
    fill_in "Nomor bast", with: @receive.nomor_bast
    fill_in "Nomor po", with: @receive.nomor_po
    fill_in "Pemilik material", with: @receive.pemilik_material
    fill_in "Project program", with: @receive.project_program
    fill_in "Tanggal bast", with: @receive.tanggal_bast
    fill_in "Tanggal po", with: @receive.tanggal_po
    click_on "Create Receive"

    assert_text "Receive was successfully created"
    click_on "Back"
  end

  test "updating a Receive" do
    visit receives_url
    click_on "Edit", match: :first

    fill_in "Jenis", with: @receive.jenis
    fill_in "Judul bast", with: @receive.judul_bast
    fill_in "Kode", with: @receive.kode
    fill_in "Kode akun", with: @receive.kode_akun
    fill_in "Nama", with: @receive.nama
    fill_in "Nama penyedia", with: @receive.nama_penyedia
    fill_in "Nomor bast", with: @receive.nomor_bast
    fill_in "Nomor po", with: @receive.nomor_po
    fill_in "Pemilik material", with: @receive.pemilik_material
    fill_in "Project program", with: @receive.project_program
    fill_in "Tanggal bast", with: @receive.tanggal_bast
    fill_in "Tanggal po", with: @receive.tanggal_po
    click_on "Update Receive"

    assert_text "Receive was successfully updated"
    click_on "Back"
  end

  test "destroying a Receive" do
    visit receives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receive was successfully destroyed"
  end
end
