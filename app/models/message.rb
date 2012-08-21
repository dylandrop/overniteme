class Message < ActiveRecord::Base
  belongs_to :from, class_name: "User", foreign_key: 'from_id'
  belongs_to :conversation
  attr_accessible :from, :to, :subject, :content, :conversation_id
  validate :can_be_sent_to_recipient

  private
  def can_be_sent_to_recipient
    if conversation.nil?
      errors.add(:base, "Something went wrong.")
    end
  end 
end
