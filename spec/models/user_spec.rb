require 'spec_helper'
require 'rspec_multi_matchers'

describe User do
  describe ".matches" do
    before :each do
      6.times { FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Men') }
      5.times { FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Women') }
      4.times { FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Women') }
      3.times { FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Men') }
      2.times { FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Women', :group => true) }
      1.times { FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Men', :group => true) }
      1.times { FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Men', :group => true) }
    end
    
    it "should return all straight females (not in a group) for a straight male" do
      user = FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Women')
      matches = user.matches
      matches.should each { |match|
        match.gender.should == 'Female'
        match.seeking.should == 'Men'
      }
      matches.length.should == 6
    end
    
    it "should return all gay males (not in a group) for a gay male" do
      user = FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Men')
      matches = user.matches
      matches.should each { |match|
        match.gender.should == 'Male'
        match.seeking.should == 'Men'
      }
      matches.length.should == 3
    end
    
    it "should return all straight males (not in a group) for a straight female" do
      user = FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Men')
      matches = user.matches
      matches.should each { |match|
        match.gender.should == 'Male'
        match.seeking.should == 'Women'
      }
      matches.length.should == 4
    end
    
    it "should return all gay females (not in a group) for a gay female" do
      user = FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Women')
      matches = user.matches
      matches.should each { |match|
        match.gender.should == 'Female'
        match.seeking.should == 'Women'
      }
      matches.length.should == 5
    end
    
    it "returns couples seeking a female for a straight female with 'group' enabled" do
      user = FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Men')
      matches = user.matches(true)
      matches.should each { |match|
        match.gender.should == 'Male'
        match.seeking.should == 'Women'
      }
      matches.length.should == 2
    end
    
    it "returns couples seeking a male for a straight male with 'group' enabled" do
      user = FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Men')
      matches = user.matches(true)
      matches.should each { |match|
        match.gender.should == 'Male'
        match.seeking.should == 'Men'
      }
      matches.length.should == 2
    end
  end
end
