require 'test_helper'

class RetursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retur = returs(:one)
  end

  test "should get index" do
    get returs_url
    assert_response :success
  end

  test "should get new" do
    get new_retur_url
    assert_response :success
  end

  test "should create retur" do
    assert_difference('Retur.count') do
      post returs_url, params: { retur: { asal_gudang: @retur.asal_gudang, dokumen_retur: @retur.dokumen_retur, gudang_pembelian: @retur.gudang_pembelian, jenis_penerimaan: @retur.jenis_penerimaan, jenis_pengeluaran: @retur.jenis_pengeluaran, keterangan_retur: @retur.keterangan_retur, kode_proyek: @retur.kode_proyek, nama_inputer: @retur.nama_inputer, nama_proyek: @retur.nama_proyek, nomor_pengeluaran: @retur.nomor_pengeluaran } }
    end

    assert_redirected_to retur_url(Retur.last)
  end

  test "should show retur" do
    get retur_url(@retur)
    assert_response :success
  end

  test "should get edit" do
    get edit_retur_url(@retur)
    assert_response :success
  end

  test "should update retur" do
    patch retur_url(@retur), params: { retur: { asal_gudang: @retur.asal_gudang, dokumen_retur: @retur.dokumen_retur, gudang_pembelian: @retur.gudang_pembelian, jenis_penerimaan: @retur.jenis_penerimaan, jenis_pengeluaran: @retur.jenis_pengeluaran, keterangan_retur: @retur.keterangan_retur, kode_proyek: @retur.kode_proyek, nama_inputer: @retur.nama_inputer, nama_proyek: @retur.nama_proyek, nomor_pengeluaran: @retur.nomor_pengeluaran } }
    assert_redirected_to retur_url(@retur)
  end

  test "should destroy retur" do
    assert_difference('Retur.count', -1) do
      delete retur_url(@retur)
    end

    assert_redirected_to returs_url
  end
end
