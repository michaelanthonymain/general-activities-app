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

    it "should assign @event by id" do
      get :show, {:id => event.id}
      expect(assigns(:event)).to eq(event)
    end

    context "current user is attending the event" do
      it "should set @attending to true" do
      end
    end

    context "current user is not attending the event" do
      it "should set @attending to false" do
      end
    end

    it "should assign @comment to a new comment" do
    end

    it "should assign @people to the event's attendees" do
    end

    it "should assign @creator to the event's creator" do
    end

    it "should assign @current_user to the current user" do
    end
  end

  describe "GET #new" do

  end

  describe "POST #create" do

    # it "it saves event user specified number of times in database" do
    #   user = User.create(name: "Amelia", email: "amelia@amelia.com")
    #   session[:user_id] = user.id
    #   number_of_occurences = 5

    #   post :create, user_id: session[:user_id], event: {
    #     name: "Test Event",
    #     description: "Testing with a factory",
    #     category_id: 1,
    #     price: 2.00,
    #     user_id: 1,
    #     signup_start: Time.new(2014, 4, 26, 2, 30, 30),
    #     signup_end: Time.new(2014, 4, 26, 2, 30, 30) + 1.day,
    #     event_start: Time.new(2014, 4, 26, 2, 30, 30) + 2.days,
    #     event_end: Time.new(2014, 4, 26, 2, 30, 30) + 3.days,
    #     uses_paypal: true,
    #     recurring_events: true,
    #     recurring_timeframe: "weekly",
    #     number_of_occurrences: number_of_occurences
    #   }

    #   events = Event.where(name: "Test Event")
    #   expect(events).should have(number_of_occurences).items
    # end

  end

  describe "GET #edit" do

  end

  describe "PATCH #update" do

  end

  describe "DELETE #destroy" do

  end
end