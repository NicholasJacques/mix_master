require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "user can edit a playlist and is redirected to that show page with that edit made available" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = create(:playlist)
    playlist.songs << [song_one, song_three]

    playlist_name = "Sweet Jamz"



    visit playlist_path(playlist)
    click_on "Edit Playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{song_two.id}")
    uncheck("song-#{song_one.id}")
    click_on "Update Playlist"

    expect(page).to have_content playlist_name

    within("ul") do
      expect(page).to have_link song_two.title, href: song_path(song_two)
    end

    within("ul") do
      expect(page).not_to have_link song_one.title, href: song_path(song_one)
    end
  end
end