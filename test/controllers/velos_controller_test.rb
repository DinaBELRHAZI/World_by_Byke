require "test_helper"

class VelosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @velo = velos(:one)
  end

  test "should get index" do
    get velos_url
    assert_response :success
  end

  test "should get new" do
    get new_velo_url
    assert_response :success
  end

  test "should create velo" do
    assert_difference("Velo.count") do
      post velos_url, params: { velo: { city: @velo.city, company: @velo.company, country: @velo.country, latitude: @velo.latitude, longitude: @velo.longitude, name: @velo.name } }
    end

    assert_redirected_to velo_url(Velo.last)
  end

  test "should show velo" do
    get velo_url(@velo)
    assert_response :success
  end

  test "should get edit" do
    get edit_velo_url(@velo)
    assert_response :success
  end

  test "should update velo" do
    patch velo_url(@velo), params: { velo: { city: @velo.city, company: @velo.company, country: @velo.country, latitude: @velo.latitude, longitude: @velo.longitude, name: @velo.name } }
    assert_redirected_to velo_url(@velo)
  end

  test "should destroy velo" do
    assert_difference("Velo.count", -1) do
      delete velo_url(@velo)
    end

    assert_redirected_to velos_url
  end
end
