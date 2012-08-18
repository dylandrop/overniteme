class Conversation < ActiveRecord::Base
  attr_accessible :from_id, :to_id
  belongs_to :from, class_name: "User", foreign_key: 'from_id'
  belongs_to :to, class_name: "User", foreign_key: 'to_id'
  has_many :messages
end
