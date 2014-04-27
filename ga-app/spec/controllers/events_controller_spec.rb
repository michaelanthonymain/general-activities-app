require 'spec_helper'

describe EventsController do

  describe "GET #index" do
    context "with a valid current user" do
      let(:user) {FactoryGirl.create(:user)}

        it "renders the index view" do
          session[:user_id] = user.id
          get :index
          response.should render_template :index
        end

        it "should populate a list of all events" do
          session[:user_id] = user.id
          event = FactoryGirl.create(:event)
          get :index
          expect(assigns(:events)).to eq([event])
        end

        it "should populate a list of all categories" do
          session[:user_id] = user.id
          category = FactoryGirl.create(:category)
          get :index
          expect(assigns(:categories)).to eq([category])
        end
    end

    context "without a valid current user" do
        it "should redirect to sessions#new" do
           session[:user_id] = nil
           get :index
           expect(response).to redirect_to(sessions_new_path)
        end
    end
  end

  describe "GET #show" do
    let(:event) {FactoryGirl.create(:event)}
    let(:user) {FactoryGirl.create(:user)}

    it "should assign @event by id" do
      get :show, {:id => event.id}
      expect(assigns(:event)).to eq(event)
    end

    # context "current user is attending the event" do
    #   it "should set @attending to true" do
    #   end
    # end

    # context "current user is not attending the event" do
    #   it "should set @attending to false" do
    #   end
    # end

    it "should assign @comment to a new comment" do
      get :show, {:id => event.id}
      assigns(:comment).should be_new_record
      assigns(:comment).kind_of?(Comment).should be_true
    end

    it "should assign @people to the event's attendees" do
      people = event.attendees
      get :show, {:id => event.id}
      expect(assigns(:people)).to eq(people)
    end

    it "should assign @creator to the event's creator" do
      creator = event.creator
      get :show, {:id => event.id}
      expect(assigns(:creator)).to eq(creator)
    end

    it "should assign @current_user to the current user" do
      session[:user_id] = user.id
      current_user = User.find(session[:user_id])
      get :show, {:id => event.id}
      expect(assigns(:current_user)).to eq(current_user)
    end
  end

  describe "GET #new" do
    let(:user) {FactoryGirl.create(:user)}

    it "should assign @event to a new event" do
        get :new, {:user_id => user.id}
        assigns(:event).should be_new_record
        assigns(:event).kind_of?(Event).should be_true
    end
  end

  describe "POST #create" do
    let(:user) {FactoryGirl.create(:user)}

    it "creates a new event" do
        session[:user_id] = user.id
        current_user = User.find(session[:user_id])
        expect {
        post :create, :user_id => user.id, event: FactoryGirl.attributes_for(:event, :user_id => user.id)
        }.to change(Event, :count).by(1)
    end

    context "with valid attributes" do
        it "it saves event user specified number of times in database" do
          user = User.create(name: "Amelia", email: "amelia@amelia.com")
          session[:user_id] = user.id
          number_of_occurences = 5

          post :create, user_id: session[:user_id], event: {
            name: "Test Event",
            description: "Testing with a factory",
            category_id: 1,
            price: 2.00,
            user_id: 1,
            signup_start: Time.new(2014, 4, 26, 2, 30, 30),
            signup_end: Time.new(2014, 4, 26, 2, 30, 30) + 1.day,
            event_start: Time.new(2014, 4, 26, 2, 30, 30) + 2.days,
            event_end: Time.new(2014, 4, 26, 2, 30, 30) + 3.days,
            uses_paypal: true,
            recurring_events: true,
            recurring_timeframe: "weekly",
            number_of_occurrences: number_of_occurences
          }

          events = Event.where(name: "Test Event")
          expect(events).should have(number_of_occurences).items
        end

        it "redirects to the new event page" do
            session[:user_id] = user.id
            current_user = User.find(session[:user_id])
            post :create, :user_id => user.id, event: FactoryGirl.attributes_for(:event, :user_id => user.id)
            response.should redirect_to Event.last
        end
    end

    # context "without valid attributes" do
    #     it "should not save a new event" do
    #       session[:user_id] = user.id
    #       current_user = User.find(session[:user_id])
    #       expect {
    #       post :create, :user_id => user.id, event: FactoryGirl.attributes_for(:event, :user_id => user.id, :name => nil)
    #       }.to_not change(Event, :count)
    #     end

    #     it "should render the new template" do
    #       post :create, :user_id => user.id, event: FactoryGirl.attributes_for(:invalid_event, :user_id =>user.id)
    #       response.should render_template :new
    #     end
    # end

  end

  describe "GET #edit" do
    let(:user) {FactoryGirl.create(:user)}
    let(:eventfind) {FactoryGirl.create(:event)}

    it "assigns @event to the event to be edited" do
        event = Event.find_by_user_id_and_id(user.id, eventfind.id)
        get :edit, {:id => eventfind.id, :user_id => user.id}
        expect(assigns(:event)).to eq(event)
    end
  end

  describe "PUT #update" do

  end

  describe "DELETE #destroy" do
    let(:user) {FactoryGirl.create(:user)}

    before :each do
      @event = FactoryGirl.create(:event, user_id: user.id)
    end

    it "deletes the event" do
        expect {
        delete :destroy, {user_id: user.id, id: @event.id}
        }.to change(Event, :count).by(-1)
    end

    it "redirects to user path" do
      delete :destroy, {user_id: @event.user_id, id: @event.id}
      response.should redirect_to user_path(@event.user_id)
    end
  end
end