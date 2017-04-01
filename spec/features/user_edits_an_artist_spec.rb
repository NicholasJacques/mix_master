require 'rails_helper'

RSpec.feature "user edits an artists" do
  scenario "user can edit an artist and be redirected to show page with updated information" do
    artist = Artist.create(name: "Wookiefoot", image_path: "https://amespoetryrevival.files.wordpress.com/2012/10/wookiefootwookie.jpg")
    visit '/artists'
    click_on "Wookiefoot"
    click_on "Edit Artist"
    expect(current_path).to eq "/artists/#{artist.id}/edit"
    fill_in "artist_name", with: "Phish"
    click_on "Update Artist"

    expect(current_path).to eq "/artists/#{artist.id}"
    expect(page).to have_content "Phish"
  end
end