class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_picture, only: [:show, :edit, :update]
  before_action :find_context, only: [:create, :edit, :new, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = Picture.new
    @submit = "New image"
  end

  def edit
    @submit = "Edit image"
  end

  def create
    redirect_to login_path, :notice => 'you have to be log in' unless current_user
    @picture = @context.pictures.create(picture_params)
    redirect_to context_path(@context)
  end

  def update
    if @picture.update(picture_params)
      redirect_to @context
    else
      render 'edit'
    end
  end

  def destroy
   @picture = @context.pictures.find_picture
   @picture.destroy
   redirect_to context_path(@context)
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :description, :image)
  end

  def find_context
    @context = Context.find(params[:context_id])
  end

  def find_picture
    @picture = Picture.find(params[:id])
  end

end
