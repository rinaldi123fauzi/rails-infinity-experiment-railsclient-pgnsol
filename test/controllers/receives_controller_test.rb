require 'test_helper'

class ReceivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receive = receives(:one)
  end

  test "should get index" do
    get receives_url
    assert_response :success
  end

  test "should get new" do
    get new_receife_url
    assert_response :success
  end

  test "should create receife" do
    assert_difference('Receive.count') do
      post receives_url, params: { receive: { jenis: @receive.jenis, judul_bast: @receive.judul_bast, kode: @receive.kode, kode_akun: @receive.kode_akun, nama: @receive.nama, nama_penyedia: @receive.nama_penyedia, nomor_bast: @receive.nomor_bast, nomor_po: @receive.nomor_po, pemilik_material: @receive.pemilik_material, project_program: @receive.project_program, tanggal_bast: @receive.tanggal_bast, tanggal_po: @receive.tanggal_po } }
    end

    assert_redirected_to receife_url(Receive.last)
  end

  test "should show receife" do
    get receife_url(@receive)
    assert_response :success
  end

  test "should get edit" do
    get edit_receife_url(@receive)
    assert_response :success
  end

  test "should update receife" do
    patch receife_url(@receive), params: { receive: { jenis: @receive.jenis, judul_bast: @receive.judul_bast, kode: @receive.kode, kode_akun: @receive.kode_akun, nama: @receive.nama, nama_penyedia: @receive.nama_penyedia, nomor_bast: @receive.nomor_bast, nomor_po: @receive.nomor_po, pemilik_material: @receive.pemilik_material, project_program: @receive.project_program, tanggal_bast: @receive.tanggal_bast, tanggal_po: @receive.tanggal_po } }
    assert_redirected_to receife_url(@receive)
  end

  test "should destroy receife" do
    assert_difference('Receive.count', -1) do
      delete receife_url(@receive)
    end

    assert_redirected_to receives_url
  end
end
