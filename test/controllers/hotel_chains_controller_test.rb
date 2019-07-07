require 'test_helper'

class HotelChainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_chain = hotel_chains(:one)
  end

  test "should get index" do
    get hotel_chains_url
    assert_response :success
  end

  test "should get new" do
    get new_hotel_chain_url
    assert_response :success
  end

  test "should create hotel_chain" do
    assert_difference('HotelChain.count') do
      post hotel_chains_url, params: { hotel_chain: { name: @hotel_chain.name } }
    end

    assert_redirected_to hotel_chain_url(HotelChain.last)
  end

  test "should show hotel_chain" do
    get hotel_chain_url(@hotel_chain)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotel_chain_url(@hotel_chain)
    assert_response :success
  end

  test "should update hotel_chain" do
    patch hotel_chain_url(@hotel_chain), params: { hotel_chain: { name: @hotel_chain.name } }
    assert_redirected_to hotel_chain_url(@hotel_chain)
  end

  test "should destroy hotel_chain" do
    assert_difference('HotelChain.count', -1) do
      delete hotel_chain_url(@hotel_chain)
    end

    assert_redirected_to hotel_chains_url
  end
end
