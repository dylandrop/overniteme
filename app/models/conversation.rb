class Conversation < ActiveRecord::Base
  belongs_to :from, class_name: "User", foreign_key: 'from_id'
  belongs_to :to, class_name: "User", foreign_key: 'to_id'
  has_many :messages
  accepts_nested_attributes_for :messages
  attr_accessible :messages_attributes, :from, :to
  validate :from_can_message_to

  private
  def from_can_message_to
    if from.gender == "Male" && to.gender == "Female"
      errors.add(:base, "You cannot create a conversation with this user.")
    end
  end
end
