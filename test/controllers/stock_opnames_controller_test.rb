require 'test_helper'

class StockOpnamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_opname = stock_opnames(:one)
  end

  test "should get index" do
    get stock_opnames_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_opname_url
    assert_response :success
  end

  test "should create stock_opname" do
    assert_difference('StockOpname.count') do
      post stock_opnames_url, params: { stock_opname: { item_id: @stock_opname.item_id, jumlah_fisik: @stock_opname.jumlah_fisik, jumlah_tersedia: @stock_opname.jumlah_tersedia, keterangan: @stock_opname.keterangan, kode_qr_code: @stock_opname.kode_qr_code, lokasi_penempatan: @stock_opname.lokasi_penempatan, measurement_id: @stock_opname.measurement_id, selisih: @stock_opname.selisih, tanggal: @stock_opname.tanggal, warehouse_id: @stock_opname.warehouse_id } }
    end

    assert_redirected_to stock_opname_url(StockOpname.last)
  end

  test "should show stock_opname" do
    get stock_opname_url(@stock_opname)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_opname_url(@stock_opname)
    assert_response :success
  end

  test "should update stock_opname" do
    patch stock_opname_url(@stock_opname), params: { stock_opname: { item_id: @stock_opname.item_id, jumlah_fisik: @stock_opname.jumlah_fisik, jumlah_tersedia: @stock_opname.jumlah_tersedia, keterangan: @stock_opname.keterangan, kode_qr_code: @stock_opname.kode_qr_code, lokasi_penempatan: @stock_opname.lokasi_penempatan, measurement_id: @stock_opname.measurement_id, selisih: @stock_opname.selisih, tanggal: @stock_opname.tanggal, warehouse_id: @stock_opname.warehouse_id } }
    assert_redirected_to stock_opname_url(@stock_opname)
  end

  test "should destroy stock_opname" do
    assert_difference('StockOpname.count', -1) do
      delete stock_opname_url(@stock_opname)
    end

    assert_redirected_to stock_opnames_url
  end
end
