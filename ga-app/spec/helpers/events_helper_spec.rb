require 'spec_helper'

describe EventsHelper do 

  context "#has_paid" do 

    it "should display paid if user has paid" do 
      helper.has_paid(true).should eq "Paid"
    end

    it "should display unpaid if user has paid" do 
      helper.has_paid(false).should eq "Unpaid"
    end

  end

end