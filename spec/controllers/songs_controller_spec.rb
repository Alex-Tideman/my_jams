require 'rails_helper'


RSpec.describe SongsController, type: :controller do

  let(:valid_attributes) {
    { title: 'Baby', artist: "Justin Bieber", song_url: nil }
  }

  let(:invalid_attributes) {
    { title: nil, artist: nil, song_url: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SongsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all songs as @song" do
      song = Song.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:songs)).to eq([song])
    end
  end

  describe "GET #show" do
    it "assigns the requested song as @song" do
      song = Song.create! valid_attributes
      get :show, {:id => song.to_param}, valid_session
      expect(assigns(:song)).to eq(song)
    end
  end

  describe "GET #new" do
    it "assigns a new song as @song" do
      get :new, {}, valid_session
      expect(assigns(:song)).to be_a_new(Song)
    end
  end

  describe "GET #edit" do
    it "assigns the requested song as @song" do
      song = Song.create! valid_attributes
      get :edit, {:id => song.to_param}, valid_session
      expect(assigns(:song)).to eq(song)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Song" do
        expect {
          post :create, {:song => valid_attributes}, valid_session
        }.to change(Song, :count).by(1)
      end

      it "assigns a newly created song as @song" do
        post :create, {:song => valid_attributes}, valid_session
        expect(assigns(:song)).to be_a(Song)
        expect(assigns(:song)).to be_persisted
      end

      it "redirects to the created song" do
        post :create, {:song => valid_attributes}, valid_session
        expect(response).to redirect_to(Song.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved song as @song" do
        post :create, {:song => invalid_attributes}, valid_session
        expect(assigns(:song)).to be_a_new(Song)
      end

      it "re-renders the 'new' template" do
        post :create, {:song => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: 'Loser', artist: 'Justin Bieber'}
      }

      it "updates the requested song" do
        song = Song.create! valid_attributes
        put :update, {:id => song.to_param, :song => new_attributes}, valid_session
        song.reload
        expect(song.artist).to eq('Justin Bieber')
        expect(song.title).to eq('Loser')

      end

      it "assigns the requested song as @song" do
        song = Song.create! valid_attributes
        put :update, {:id => song.to_param, :song => valid_attributes}, valid_session
        expect(assigns(:song)).to eq(song)
      end

      it "redirects to the song" do
        song = Song.create! valid_attributes
        put :update, {:id => song.to_param, :song => valid_attributes}, valid_session
        expect(response).to redirect_to(song)
      end
    end

    context "with invalid params" do
      it "assigns the song as @song" do
        song = Song.create! valid_attributes
        put :update, {:id => song.to_param, :song => invalid_attributes}, valid_session
        expect(assigns(:song)).to eq(song)
      end

      it "re-renders the 'edit' template" do
        song = Song.create! valid_attributes
        put :update, {:id => song.to_param, :song => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested song" do
      song = Song.create! valid_attributes
      expect {
        delete :destroy, {:id => song.to_param}, valid_session
      }.to change(Song, :count).by(-1)
    end

    it "redirects to the song list" do
      song = Song.create! valid_attributes
      delete :destroy, {:id => song.to_param}, valid_session
      expect(response).to redirect_to(songs_url)
    end
  end

end
