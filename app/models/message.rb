class Message < ActiveRecord::Base
  belongs_to :from, class_name: "User", foreign_key: 'from_id'
  belongs_to :to, class_name: "User", foreign_key: 'to_id'
  belongs_to :conversation
  attr_accessible :from, :to, :subject, :content
end
