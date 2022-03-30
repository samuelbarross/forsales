require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "creating a Client" do
    visit clients_url
    click_on "New Client"

    fill_in "Birth date", with: @client.birth_date
    fill_in "City", with: @client.city
    fill_in "Country", with: @client.country
    fill_in "Email", with: @client.email
    fill_in "Name", with: @client.name
    fill_in "Neighborhood", with: @client.neighborhood
    fill_in "Number", with: @client.number
    fill_in "Phone", with: @client.phone
    fill_in "State", with: @client.state
    fill_in "Status", with: @client.status
    fill_in "Street", with: @client.street
    fill_in "User", with: @client.user_id
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "updating a Client" do
    visit clients_url
    click_on "Edit", match: :first

    fill_in "Birth date", with: @client.birth_date
    fill_in "City", with: @client.city
    fill_in "Country", with: @client.country
    fill_in "Email", with: @client.email
    fill_in "Name", with: @client.name
    fill_in "Neighborhood", with: @client.neighborhood
    fill_in "Number", with: @client.number
    fill_in "Phone", with: @client.phone
    fill_in "State", with: @client.state
    fill_in "Status", with: @client.status
    fill_in "Street", with: @client.street
    fill_in "User", with: @client.user_id
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "destroying a Client" do
    visit clients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client was successfully destroyed"
  end
end
