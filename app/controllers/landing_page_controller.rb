class LandingPageController < ApplicationController
  MAX_ITEMS = 20
  def index
    # TODO: There's probably a more efficient way of doing this
    @top = User.where(:id => Follow.group(:following_id).order("count(*) desc").limit(MAX_ITEMS).count.keys)
    # If there is not enough followers to fill the list, add fill it with people with none
    if @top.count < MAX_ITEMS
      @top = @top + User.all.limit(MAX_ITEMS - @top.count)
      @top = @top.uniq
    end
    render :layout => "landing_page"
  end
end
