require 'test_helper'

class MaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = materials(:one)
  end

  test "should get index" do
    get materials_url
    assert_response :success
  end

  test "should get new" do
    get new_material_url
    assert_response :success
  end

  test "should create material" do
    assert_difference('Item.count') do
      post materials_url, params: { item: { nama_material: @item.nama_material, satuan: @item.satuan } }
    end

    assert_redirected_to material_url(Item.last)
  end

  test "should show material" do
    get material_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_url(@item)
    assert_response :success
  end

  test "should update material" do
    patch material_url(@item), params: { item: { nama_material: @item.nama_material, satuan: @item.satuan } }
    assert_redirected_to material_url(@item)
  end

  test "should destroy material" do
    assert_difference('Item.count', -1) do
      delete material_url(@item)
    end

    assert_redirected_to materials_url
  end
end
