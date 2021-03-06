require 'spec_helper'
require 'rspec_multi_matchers'

describe User do

  it { should allow_value('fdsa@columbia.edu').for(:email) }
  it { should allow_value('fdsa@barnard.edu').for(:email) }
  it { should_not allow_value('fdsa@gmail.com').for(:email) }
  it { should ensure_inclusion_of(:gender).in_array(%w[Male Female]) }
  it { should ensure_inclusion_of(:seeking).in_array(%w[Men Women Either]) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:description) }

  describe ".matches" do
    before :each do
      6.times { FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Men') }
      5.times { FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Women') }
      4.times { FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Women') }
      3.times { FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Men') }
    end
    
    it "should return all straight females for a straight male" do
      user = FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Women')
      matches = user.matches
      matches.should each { |match|
        match.gender.should == 'Female'
        match.seeking.should == 'Men'
      }
      matches.length.should == 6
    end
    
    it "should return all gay males for a gay male" do
      user = FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Men')
      matches = user.matches
      matches.should each { |match|
        match.gender.should == 'Male'
        match.seeking.should == 'Men'
      }
      matches.length.should == 3
    end
    
    it "should return all straight males for a straight female" do
      user = FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Men')
      matches = user.matches
      matches.should each { |match|
        match.gender.should == 'Male'
        match.seeking.should == 'Women'
      }
      matches.length.should == 4
    end
    
    it "should return all gay females for a gay female" do
      user = FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Women')
      matches = user.matches
      matches.should each { |match|
        match.gender.should == 'Female'
        match.seeking.should == 'Women'
      }
      matches.length.should == 5
    end

    it "should return all gay females and straight males for a bisexual female" do
      user = FactoryGirl.create(:user, :gender => 'Female', :seeking => 'Either')
      matches = user.matches
      matches.should each { |match|
        match.seeking.should == 'Women'
      }
      matches.length.should == 9
    end

    it "should return all gay males and straight females for a bisexual male" do
      user = FactoryGirl.create(:user, :gender => 'Male', :seeking => 'Either')
      matches = user.matches
      matches.should each { |match|
        match.seeking.should == 'Men'
      }
      matches.length.should == 9
    end
  end
end
