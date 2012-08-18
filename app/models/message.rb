class Message < ActiveRecord::Base
  attr_accessible :content, :conversation_id, :from, :subject, :to
  belongs_to :from, class_name: "User", foreign_key: 'from_id'
  belongs_to :to, class_name: "User", foreign_key: 'to_id'
  belongs_to :conversation
end
