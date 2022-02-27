require 'test_helper'

class ExpendituresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale = expenditures(:one)
  end

  test "should get index" do
    get expenditures_url
    assert_response :success
  end

  test "should get new" do
    get new_expenditure_url
    assert_response :success
  end

  test "should create expenditure" do
    assert_difference('Expenditure.count') do
      post expenditures_url, params: { sale: { jenis_pengeluaran: @sale.jenis_pengeluaran, keterangan_pengeluaran: @sale.keperluan_pengeluaran, nomor_pengeluaran: @sale.nomor_pengeluaran, status_id: @sale.status_id, tanggal_pengeluaran: @sale.tanggal_pengeluaran, user_id: @sale.user_id, warehouse_id: @sale.warehouse_id } }
    end

    assert_redirected_to expenditure_url(Expenditure.last)
  end

  test "should show expenditure" do
    get expenditure_url(@sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_expenditure_url(@sale)
    assert_response :success
  end

  test "should update expenditure" do
    patch expenditure_url(@sale), params: { sale: { jenis_pengeluaran: @sale.jenis_pengeluaran, keterangan_pengeluaran: @sale.keperluan_pengeluaran, nomor_pengeluaran: @sale.nomor_pengeluaran, status_id: @sale.status_id, tanggal_pengeluaran: @sale.tanggal_pengeluaran, user_id: @sale.user_id, warehouse_id: @sale.warehouse_id } }
    assert_redirected_to expenditure_url(@sale)
  end

  test "should destroy expenditure" do
    assert_difference('Expenditure.count', -1) do
      delete expenditure_url(@sale)
    end

    assert_redirected_to expenditures_url
  end
end
