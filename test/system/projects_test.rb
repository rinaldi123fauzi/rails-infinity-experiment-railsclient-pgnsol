require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Dokumen pengeluaran", with: @project.dokumen_pengeluaran
    fill_in "Jenis pengeluaran", with: @project.jenis_pengeluaran
    fill_in "Keterangan pengeluaran", with: @project.keterangan_pengeluaran
    fill_in "Kode proyek", with: @project.kode_proyek
    fill_in "Nomor pengeluaran", with: @project.nomor_pengeluaran
    fill_in "Status", with: @project.status_id
    fill_in "Tanggal pengeluaran", with: @project.tanggal_pengeluaran
    fill_in "User", with: @project.user_id
    fill_in "Warehouse", with: @project.warehouse_id
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Dokumen pengeluaran", with: @project.dokumen_pengeluaran
    fill_in "Jenis pengeluaran", with: @project.jenis_pengeluaran
    fill_in "Keterangan pengeluaran", with: @project.keterangan_pengeluaran
    fill_in "Kode proyek", with: @project.kode_proyek
    fill_in "Nomor pengeluaran", with: @project.nomor_pengeluaran
    fill_in "Status", with: @project.status_id
    fill_in "Tanggal pengeluaran", with: @project.tanggal_pengeluaran
    fill_in "User", with: @project.user_id
    fill_in "Warehouse", with: @project.warehouse_id
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
