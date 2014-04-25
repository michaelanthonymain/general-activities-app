require 'spec_helper'

describe UsersController do
  context "GET User" do
    let(:user) { FactoryGirl.create(:user) }

      it "should access the show template without http error" do
        get :show, {:id => user.id}
        expect(response.status).to eq(200)
      end

      it "assigns @user by id" do
        get :show, {:id => user.id}
        expect(assigns(:user)).to eq(user)
      end

      it "assigns the user's attended events" do
        attended_events = user.attended_events
        get :show, {:id => user.id}
        expect(assigns(:attended_events)).to eq(attended_events)
      end

      it "assigns the user's created events" do
        created_events = user.created_events
        get :show, {:id => user.id}
        expect(assigns(:created_events)).to eq(created_events)
      end

  end
end