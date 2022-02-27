require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { dokumen_pengeluaran: @project.dokumen_pengeluaran, jenis_pengeluaran: @project.jenis_pengeluaran, keterangan_pengeluaran: @project.keterangan_pengeluaran, kode_proyek: @project.kode_proyek, nomor_pengeluaran: @project.nomor_pengeluaran, status_id: @project.status_id, tanggal_pengeluaran: @project.tanggal_pengeluaran, user_id: @project.user_id, warehouse_id: @project.warehouse_id } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { dokumen_pengeluaran: @project.dokumen_pengeluaran, jenis_pengeluaran: @project.jenis_pengeluaran, keterangan_pengeluaran: @project.keterangan_pengeluaran, kode_proyek: @project.kode_proyek, nomor_pengeluaran: @project.nomor_pengeluaran, status_id: @project.status_id, tanggal_pengeluaran: @project.tanggal_pengeluaran, user_id: @project.user_id, warehouse_id: @project.warehouse_id } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
