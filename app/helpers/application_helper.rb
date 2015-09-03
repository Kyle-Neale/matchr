module ApplicationHelper
  def name(user)
    if user.name
      case user
      when user
        user.name.partition(' ').first
      when @user
        user.name.partition(' ').first
      end
    end
  end
  def age(user)
    if user.date_of_birth
      user.date_of_birth + " yrs +"
    end
  end
  def location(user)
    if user.location
      case user
      when user
        user.location.partition(',').first
      when @user
        user.location.partition(',').first
      end
    end
  end
  def bio(user)
    unless user.bio.blank?
    	user.bio
    else
    	"this user did not fill out their bio yet".humanize
    end
  end

end