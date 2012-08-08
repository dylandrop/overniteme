class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :group, :gender, :seeking, :description
  
  validates_format_of :email, with: /^\w+@columbia\.edu$/
  
  GENDERS = ['Male','Female','Couple with 1+ men','Couple with no men']
  SEEKING = ['Men','Women','Either']
  
  validate :gender_is_selected
  validate :seeking_is_selected
  
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
  
  def matches with_group = false
    if gender == 'Male'
      if seeking == 'Women'
        User.where(gender: 'Female', seeking: 'Men', group: with_group).where("id != ?", self.id)
      else
        User.where(gender: 'Male', seeking: 'Men', group: with_group).where("id != ?", self.id)
      end
    else
      if seeking == 'Men'
        User.where(gender: 'Male', seeking: 'Women', group: with_group).where("id != ?", self.id)
      else
        User.where(gender: 'Female', seeking: 'Women', group: with_group).where("id != ?", self.id)
      end
    end
  end
end
