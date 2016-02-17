class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.poster = current_user
    respond_to do |format|
      if @post.save
        flash[:notice] = "Post Created!"
      else
        flash[:error] = "An Error has occured"
      end
      # Show all content for response
      @content = current_user.get_tracks(nil) + current_user.get_posts(nil)
      @content = @content.sort {|e1, e2| e2[:created_at] <=> e1[:created_at]}
      @post = Post.new
      # JS Reponse
      format.js
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:notice] = "Post Updated!"
      else
        flash[:error] = "An Error has occured"
      end
      @posts = current_user.get_posts(false)
      format.js
    end
  end


  def delete
    @post = Post.find(params[:post_id])
    @post.removed = true
    respond_to do |format|
      if @post.save
        flash[:notice] = "Post Deleted!"
      else
        flash[:error] = "An Error has occured"
      end
      # Show all content for response
      @content = current_user.get_tracks(nil) + current_user.get_posts(nil)
      @content = @content.sort {|e1, e2| e2[:created_at] <=> e1[:created_at]}
      # JS Reponse
      format.js
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :clique_only)
  end
end
