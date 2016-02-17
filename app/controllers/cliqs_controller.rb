class CliqsController < ApplicationController
  # ----------------------- Default RESTFUL Actions-----------------------------
  def new
    @clique = Cliq.new
  end

  def create
    # Creates Clique
    @clique = Cliq.new(clique_params)
    @clique.owner = current_user
    # Saves and Redirects
    if @clique.save
      flash[:notice] = "Clique Created!"
    else
      flash[:alert] = "There was an error while creating your Clique"
    end
    redirect_to clique_settings_path
  end

  def update
    @clique = Cliq.find(params[:id])
    respond_to do |format|
      if @clique.update_attributes(clique_params)
        flash[:notice] = "Clique Updated!"
        format.js
      else
        flash[:alert] = "There was an error while updating your Clique"
        format.js
      end
    end
  end

  def show
    @clique = Cliq.find(params[:id])
  end
  # ----------------------- Custom RESTFUL Actions------------------------------
  def join
    @clique = Cliq.find(params[:cliq_id])
    raise "Already in Clique" if current_user.cliques.include? @clique
    # TODO: Add some kind of payment thing and validation

    @clique.members << current_user
    # Response
    respond_to do |format|
      if @clique.save
        flash[:notice] = "Joined " + @clique.name
      else
        flash[:alert] = "An error has occured"
      end
      @user = @clique.owner
      format.js
    end
  end

  def leave
    @clique = Cliq.find(params[:cliq_id])
    # TODO: Add some kind of payment thing and validation
    @clique.members.delete(current_user)
    # Response
    respond_to do |format|
      if @clique.save
        flash[:notice] = "Left " + @clique.name
      else
        flash[:alert] = "An error has occured"
      end
      @user = @clique.owner
      format.js
    end
  end

  private
  def clique_params
    params.require(:cliq).permit(:name, :price, :description, :thank_you_message)
  end
end
