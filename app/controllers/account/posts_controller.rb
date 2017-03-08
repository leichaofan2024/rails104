class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end
  def edit
    @post = current_user.post.find(params[:id])
  end
  def update
    @post = current_user.post.find(params[:id])
    @post.update(post_params)
    redirect_to account_posts_path, notice: "update successfull"
  end
  def destroy
    @post = current_user.post.find(params[:id])
    @post.destroy
    redirect_to account_posts_path
    flash[:alert] = "Destroy successfull"
  end
end
