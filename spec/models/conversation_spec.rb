require 'spec_helper'

describe Conversation do
  describe "#from_can_message_to" do
    it "should allow females to message males" do
      user1 = FactoryGirl.create(:user, gender: "Female")
      user2 = FactoryGirl.create(:user, gender: "Male")
      conversation = FactoryGirl.build(:conversation, from: user1, to: user2)
      conversation.should be_valid
    end

    it "should not allow males to message females" do
      user1 = FactoryGirl.create(:user, gender: "Male")
      user2 = FactoryGirl.create(:user, gender: "Female")
      conversation = FactoryGirl.build(:conversation, from: user1, to: user2)
      conversation.should_not be_valid
    end

    it "should allow males to message males" do
      user1 = FactoryGirl.create(:user, gender: "Male")
      user2 = FactoryGirl.create(:user, gender: "Male")
      conversation = FactoryGirl.build(:conversation, from: user1, to: user2)
      conversation.should be_valid
    end
  end
end
