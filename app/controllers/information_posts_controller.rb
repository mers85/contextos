class InformationPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_context, only: [:create, :edit, :new, :update, :destroy]

  def index
    @information_posts = InformationPost.all
  end

  def show
    @information_post = InformationPost.find(params[:id])
  end

  def new
    @information_post = InformationPost.new
    @submit = "New info"
  end

  def edit
    @information_post = InformationPost.find(params[:id])
    @submit = "EDIT info"
  end

  def create
    redirect_to login_path, :notice => 'you have to be log in' unless current_user
    @information_post = @context.information_posts.create(information_post_params)
    redirect_to context_path(@context)
  end

  def update
    @information_post = InformationPost.find(params[:id])
    if @information_post.update(information_post_params)
      redirect_to @context
    else
      render 'edit'
    end
  end

  def destroy
   @information_post = @context.information_posts.find(params[:id])
   @information_post.destroy
   redirect_to context_path(@context)
  end

  private
  def information_post_params
    params.require(:information_post).permit(:title, :summary, :url)
  end

  def find_context
    @context = Context.find(params[:context_id])
  end

end
