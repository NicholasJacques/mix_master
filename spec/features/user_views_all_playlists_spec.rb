require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see ta list of all playlists" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist_one, playlist_two = create_list(:playlist, 2)

    playlist_one_name = playlist_one.name
    playlist_two_name = playlist_two.name

    visit playlists_path

    within("li:first") do
      expect(page).to have_link playlist_one.name, href: playlist_path(playlist_one)
    end

    within("li:last") do
      expect(page).to have_link playlist_two.name, href: playlist_path(playlist_two)
    end
  end
end