require "application_system_test_case"

class HotelChainsTest < ApplicationSystemTestCase
  setup do
    @hotel_chain = hotel_chains(:one)
  end

  test "visiting the index" do
    visit hotel_chains_url
    assert_selector "h1", text: "Hotel Chains"
  end

  test "creating a Hotel chain" do
    visit hotel_chains_url
    click_on "New Hotel Chain"

    fill_in "Name", with: @hotel_chain.name
    click_on "Create Hotel chain"

    assert_text "Hotel chain was successfully created"
    click_on "Back"
  end

  test "updating a Hotel chain" do
    visit hotel_chains_url
    click_on "Edit", match: :first

    fill_in "Name", with: @hotel_chain.name
    click_on "Update Hotel chain"

    assert_text "Hotel chain was successfully updated"
    click_on "Back"
  end

  test "destroying a Hotel chain" do
    visit hotel_chains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hotel chain was successfully destroyed"
  end
end
