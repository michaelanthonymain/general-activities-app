require 'spec_helper'

describe CommentsController do

  describe "POST #create" do
    let(:user) {FactoryGirl.create(:user)}
    let(:event) {FactoryGirl.create(:event)}

    it "creates a new comment" do
      session[:user_id] = user.id
      expect {
        post :create, {event_id: event.id, user_id: session[:user_id], comment: FactoryGirl.attributes_for(:comment)}
        }.to change(Comment, :count).by(1)
    end

    it "redirects to the commented event" do
      post :create, {event_id: event.id, user_id: session[:user_id], comment: FactoryGirl.attributes_for(:comment)}
      response.should redirect_to event
    end
  end

  # describe "DELETE #destroy" do
  #   let(:user) {FactoryGirl.create(:user)}
  #   let(:event) {FactoryGirl.create(:event)}

  #   # it "finds the requested comment" do
  #   #   comment = Comment.find(format: )
  #   # end

  #   it "destroys the requested comment" do
  #     comment = FactoryGirl.create(:comment, event_id: event.id)
  #     expect {
  #       delete :destroy, {event_id: event.id, id: comment.id}
  #     }.to change(Comment, :count).by(-1)
  #   end

  #   it "redirects to the event page" do
  #     comment = FactoryGirl.create(:comment, event_id: event.id)
  #     delete :destroy, {event_id: event.id, id: comment.id}
  #     response.should redirect_to event
  #   end
  # end

end