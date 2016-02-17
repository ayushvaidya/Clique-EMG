class SettingsController < ApplicationController
  # ----------------------- Custom RESTFUL Actions------------------------------
  def account_settings
  end

  def edit_profile
  end

  def orders
  end

  def edit_clique
    @clique = current_user.clique
    respond_to do |format|
      format.js
    end
  end

  def clique_members
    @clique = current_user.clique
    respond_to do |format|
      format.js
    end
  end

  def clique_orders
  end

  def change_password
    respond_to do |format|
      format.js
    end
  end

  def clique_settings
    @clique = current_user.clique
    if !@clique
      @clique = Cliq.new
    end
  end

  def payment_settings
    respond_to do |format|
      format.js
    end
  end
end
