class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :gender, :seeking, :description, :profile_picture
  
  validates_format_of :email, with: /^\w+(@columbia\.edu|@barnard\.edu)$/
  
  GENDERS = ['Male','Female']
  SEEKING = ['Men','Women','Either']
  
  validate :gender_is_selected
  validate :seeking_is_selected
  validates :profile_picture, :attachment_presence => true

  has_attached_file :profile_picture,
    :styles => {
       :small  => "300x300>" 
    },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/:style/:id/:filename"

  def conversations
    Conversation.where("to_id = ? OR from_id = ?", id, id)
  end
  
  def gender_is_selected
    if !GENDERS.include?(gender)
      errors.add(:gender, "needs to be selected from the dropdown.")
    end
  end
  
  def seeking_is_selected
    if !SEEKING.include?(seeking)
      errors.add(:seeking, "needs to be specified.")
    end
  end
  
  def matches
    if seeking == 'Either'
      return other_users_who_are_seeking('Men') if gender == 'Male'
      return other_users_who_are_seeking('Women') if gender == 'Female'
    elsif gender == 'Male'
      if seeking == 'Women'
        other_users_who_are_seeking('Men').where(gender: 'Female')
      else
        other_users_who_are_seeking('Men').where(gender: 'Male')
      end
    else
      if seeking == 'Men'
        other_users_who_are_seeking('Women').where(gender: 'Male')
      else
        other_users_who_are_seeking('Women').where(gender: 'Female')
      end
    end
  end

  def can_be_messaged_by other_user
    return false if (other_user.gender == 'Male' && gender == 'Female') || self == other_user
    true
  end

  private
  def other_users_who_are_seeking gender
    User.where("seeking = ? OR seeking = ?", 'Either', gender).where("id != ?", self.id)
  end
end
