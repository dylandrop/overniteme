class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :gender, :seeking, :description
  
  validates_format_of :email, with: /^\w+@columbia\.edu$/
  
  GENDERS = ['Male','Female']
  SEEKING = ['Men','Women','Either']
  
  validate :gender_is_selected
  validate :seeking_is_selected

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
      return User.where(seeking: 'Men') if gender == 'Male'
      return User.where(seeking: 'Women') if gender == 'Female'
    elsif gender == 'Male'
      if seeking == 'Women'
        User.where(gender: 'Female', seeking: 'Men').where("id != ?", self.id)
      else
        User.where(gender: 'Male', seeking: 'Men').where("id != ?", self.id)
      end
    else
      if seeking == 'Men'
        User.where(gender: 'Male', seeking: 'Women').where("id != ?", self.id)
      else
        User.where(gender: 'Female', seeking: 'Women').where("id != ?", self.id)
      end
    end
  end
end
