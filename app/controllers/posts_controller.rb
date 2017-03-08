class PostsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @posts = @group.posts
  end
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
  def show
      @post = Post.find(params[:post_id])
    @group = Group.find(params[:group_id])
    @post.group = @group


  end
  private

  def post_params
    params.require(:post).permit(:content,:title)
  end
end
