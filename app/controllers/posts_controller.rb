class PostsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@users=current_user
  	@posts = Post.where("user_id IN (?)", current_user)
  end

  def new 
  	@post=current_user.posts.build
  end

  def create
  	@post=current_user.posts.build(post_params)
  	if @post.save
     	redirect_to posts_path
     else
     	render 'new'
    end
  end

  def show
  	@post=Post.find(params[:id])
  end

  def edit
  	@post=Post.find(params[:id])
  end

  def update
 	@post=Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to post_path
  end

  def destroy
  	@post=Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_path
  end

  private
   def post_params
   	params.require(:post).permit(:fullname,:address,:tel_number,:mob_number,:email,:image)
   end
end
