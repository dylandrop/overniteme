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

  describe "#link_title" do
    before do
      @me = FactoryGirl.create(:user, username: "Bob")
      @other = FactoryGirl.create(:user, username: "Fred")
    end

    it "should give a title with the user it's from if I am receiving it" do
      conversation = FactoryGirl.build(:conversation, from: @other, to: @me)
      conversation.link_title(@me).should include(@other.username)
    end

    it "should give a title with the user it's from if I am sending it" do
      conversation = FactoryGirl.build(:conversation, from: @me, to: @other)
      conversation.link_title(@me).should include(@other.username)
    end
  end
end
