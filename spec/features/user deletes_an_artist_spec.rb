require 'rails_helper'

RSpec.feature "user deletes an artists" do
  scenario "user can delete an artist and be redirected artists index and that artist no longer exists" do
    artist = Artist.create(name: "Wookiefoot", image_path: "https://amespoetryrevival.files.wordpress.com/2012/10/wookiefootwookie.jpg")
    visit '/artists'
    click_on "Wookiefoot"
    click_on "Delete Artist"

    expect(current_path).to eq "/artists"
    expect(page).not_to have_content "Wookiefoot"
  end
end