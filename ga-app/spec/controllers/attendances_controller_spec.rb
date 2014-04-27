require 'spec_helper'

describe AttendancesController do

  describe "POST #create" do
    let(:user) {FactoryGirl.create(:user)}
    let(:event) {FactoryGirl.create(:event)}

    it "creates a new attendance" do
      session[:user_id] = user.id
      expect {
      post :create, {format: event.id, attendance: FactoryGirl.attributes_for(:attendance, user_id: user.id) }
      }.to change(Attendance, :count).by(1)
    end

    it "redirects to the attended event" do
      post :create, {format: event.id, attendance: FactoryGirl.attributes_for(:attendance, user_id: user.id) }
      response.should redirect_to Event.find(event.id)
    end
  end

  describe "GET #edit" do
    let(:att) {FactoryGirl.create(:attendance)}

    it "assigns @attendance by id in params" do
      get :edit, {id: att.id}
      expect(assigns(:attendance)).to eq(att)
    end
  end

  describe "PUT #update" do
    let(:att) {FactoryGirl.create(:attendance)}
    let(:event) {FactoryGirl.create(:event)}

    it "located the requested attendance" do
      put :update, {id: att.id, attendance: FactoryGirl.attributes_for(:attendance)}
      expect(assigns(:attendance_to_update)).to eq(att)
    end

    it "changes the attendance's attributes" do
      put :update, {id: att.id, attendance: FactoryGirl.attributes_for(:attendance, is_paid: true)}
      att.reload
      att.is_paid.should eq(true)
    end

    it "redirects to the updated event" do
      put :update, {id: att.id, attendance: FactoryGirl.attributes_for(:attendance, event_id: event.id)}
      response.should redirect_to event
    end
  end

  # describe "DELETE #destroy" do
  #   let(:user) {FactoryGirl.create(:user)}

  #   before :each do
  #     @att = FactoryGirl.create(:attendance, user_id: user.id)
  #   end

  #   it "locates the requested attendance" do
  #       pending
  #   end

  #   it "deletes the attendance" do
  #     expect {
  #           delete :destroy, {id: att.id}
  #         }.to change(Attendance, :count).by(-1)
  #   end

  #   it "redirects to the associated event" do
  #     pending
  #   end
  # end

end