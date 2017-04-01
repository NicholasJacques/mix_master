require 'rails_helper'

RSpec.feature "user views all artists" do
  scenario "user can see list of artists and artist name links to show page" do
    artist_1 = Artist.create(name: "Wookiefoot", image_path: "https://amespoetryrevival.files.wordpress.com/2012/10/wookiefootwookie.jpg")
    artist_2 = Artist.create(name: "Twiddle", image_path: "http://cdn.ticketfly.com/i/00/01/92/94/33-atxl1.jpg")
    artist_1_name = artist_1.name
    artist_2_name = artist_2.name

    visit '/artists'

    expect(page).to have_content artist_1_name
    expect(page).to have_content artist_1_name

    click_on "Wookiefoot"

    expect(current_path).to eq "/artists/#{artist_1.id}"
  end
end