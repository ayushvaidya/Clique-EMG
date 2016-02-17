module ApplicationHelper
  def is_following(following)
    # TODO: Make this more efficient?
    current_user.following.each do |f|
      if f.following == following
        return true
      end
    end
    return false
  end
end
