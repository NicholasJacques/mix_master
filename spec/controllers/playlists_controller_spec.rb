require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "GET#index" do
    it "assigns all playlists as @playlists and renders the index template" do 
      playlist = create(:playlist)

      get(:index)

      expect(assigns(:playlists)).to eq([playlist])
      expect(response).to render_template("index")
    end
  end

  describe "GET#show" do
    it "assigns the requested playlist as @playlist and renders show template" do
      playlist = create(:playlist)

      get(:show, {:id => playlist.to_param})
      expect(assigns(:playlist)).to eq(playlist)
      expect(response).to render_template("show")
    end
  end

  describe "GET#new" do
    it "assigns a newly created playlist as @playlist" do
      get :new

      expect(assigns(:playlist)).to be_a_new(Playlist)
    end
  end

  describe "GET#edit" do
    it "assigns the requested playlist as @playlist" do
      playlist = create(:playlist)
      get :edit, {:id => playlist.to_param}

      expect(assigns(:playlist)).to eq(playlist)
    end
  end

  describe "POST#create" do
    context "with valid params" do
      it"creates a new playlist" do
        expect {
          post :create, {:playlist => attributes_for(:artist)}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns newly created playlist as playlist" do
        post :create, {:playlist => attributes_for(:artist)}

        expect(assigns(:playlist)).to be_a(Playlist)
      end

      it "redirects to the created playlist's show page" do
        post :create, {:playlist => attributes_for(:artist)}

        expect(response).to redirect_to(Playlist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}

        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it "re-renders the 'new' template" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}

        expect(response).to render_template("new")
      end
    end

    describe " PUT #update" do
      context "with valid params" do
        it "updates the request playlist" do
          playlist = create(:playlist)
          put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}
          playlist.reload

          expect(playlist.name).to eq("New name")
        end

        it "assigns the request playlist as @playlist" do
          playlist = create(:playlist)
          put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}

          expect(assigns(:playlist)).to eq(playlist)
        end

        it "redirects to the playlist" do
          playlist = create(:playlist)
          put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}

          expect(response).to redirect_to(playlist)
        end
      end

      context "with invalid params" do
        it "assigns the playlist as @playlist" do
          playlist = create(:playlist)
          put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}

          expect(assigns(:playlist)).to eq(playlist)
        end

        it "re-renders the 'edit' template" do
          playlist = create(:playlist)
          put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}

          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE#destroy" do
      it "destroys the requested artist" do
        playlist = create(:playlist)
        expect {
          delete :destroy, {:id => playlist.to_param}
        }.to change(Playlist, :count).by(-1)
      end

      it "redirects to the playlists index" do
        playlist = create(:playlist)
        delete :destroy, {:id => playlist.to_param}

        expect(response).to redirect_to(playlists_path)
      end
    end
  end
end