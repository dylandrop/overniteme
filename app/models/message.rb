class Message < ActiveRecord::Base
  attr_accessible :content, :conversation_id, :from_id, :subject, :to_id
  belongs_to :user, class_name: "User", foreign_key: 'from_id'
  belongs_to :user, class_name: "User", foreign_key: 'to_id'
  belongs_to :conversation
end
