require 'test_helper'

class MaintenanceAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_asset = maintenance_assets(:one)
  end

  test "should get index" do
    get maintenance_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_maintenance_asset_url
    assert_response :success
  end

  test "should create maintenance_asset" do
    assert_difference('MaintenanceAsset.count') do
      post maintenance_assets_url, params: { maintenance_asset: { dokumen_pengeluaran: @maintenance_asset.dokumen_pengeluaran, jenis_pengeluaran: @maintenance_asset.jenis_pengeluaran, keterangan_pengeluaran: @maintenance_asset.keterangan_pengeluaran, kode_proyek: @maintenance_asset.kode_proyek, nomor_pengeluaran: @maintenance_asset.nomor_pengeluaran, status_id: @maintenance_asset.status_id, tanggal_pengeluaran: @maintenance_asset.tanggal_pengeluaran, user_id: @maintenance_asset.user_id, warehouse_id: @maintenance_asset.warehouse_id } }
    end

    assert_redirected_to maintenance_asset_url(MaintenanceAsset.last)
  end

  test "should show maintenance_asset" do
    get maintenance_asset_url(@maintenance_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintenance_asset_url(@maintenance_asset)
    assert_response :success
  end

  test "should update maintenance_asset" do
    patch maintenance_asset_url(@maintenance_asset), params: { maintenance_asset: { dokumen_pengeluaran: @maintenance_asset.dokumen_pengeluaran, jenis_pengeluaran: @maintenance_asset.jenis_pengeluaran, keterangan_pengeluaran: @maintenance_asset.keterangan_pengeluaran, kode_proyek: @maintenance_asset.kode_proyek, nomor_pengeluaran: @maintenance_asset.nomor_pengeluaran, status_id: @maintenance_asset.status_id, tanggal_pengeluaran: @maintenance_asset.tanggal_pengeluaran, user_id: @maintenance_asset.user_id, warehouse_id: @maintenance_asset.warehouse_id } }
    assert_redirected_to maintenance_asset_url(@maintenance_asset)
  end

  test "should destroy maintenance_asset" do
    assert_difference('MaintenanceAsset.count', -1) do
      delete maintenance_asset_url(@maintenance_asset)
    end

    assert_redirected_to maintenance_assets_url
  end
end
