require 'test_helper'

class ExpenditureItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_item = expenditure_items(:one)
  end

  test "should get index" do
    get expenditure_items_url
    assert_response :success
  end

  test "should get new" do
    get new_expenditure_item_url
    assert_response :success
  end

  test "should create expenditure_item" do
    assert_difference('ExpenditureItem.count') do
      post expenditure_items_url, params: { sale_item: { expenditure_id: @sale_item.expenditure_id, item_id: @sale_item.item_id, jumlah_keluar: @sale_item.jumlah_keluar, jumlah_tersedia: @sale_item.jumlah_tersedia } }
    end

    assert_redirected_to expenditure_item_url(ExpenditureItem.last)
  end

  test "should show expenditure_item" do
    get expenditure_item_url(@sale_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_expenditure_item_url(@sale_item)
    assert_response :success
  end

  test "should update expenditure_item" do
    patch expenditure_item_url(@sale_item), params: { sale_item: { expenditure_id: @sale_item.expenditure_id, item_id: @sale_item.item_id, jumlah_keluar: @sale_item.jumlah_keluar, jumlah_tersedia: @sale_item.jumlah_tersedia } }
    assert_redirected_to expenditure_item_url(@sale_item)
  end

  test "should destroy expenditure_item" do
    assert_difference('ExpenditureItem.count', -1) do
      delete expenditure_item_url(@sale_item)
    end

    assert_redirected_to expenditure_items_url
  end
end
