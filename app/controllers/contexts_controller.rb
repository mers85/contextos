class ContextsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @contexts = Context.all
  end

  def show
    @context = Context.find(params[:id])
  end

  def new
    @context = Context.new
    @submit = "New context"
  end

  def edit
    @context = Context.find(params[:id])
    @submit = "Edit context"
  end

  def create
    @context = current_user.contexts.new(context_params) rescue nil

    if @context && @context.save
      redirect_to @context, notice: 'Context saved!'
    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def update
    @context = Context.find(params[:id])
    if @context.update!(context_params)
      redirect_to @context
    else
      render 'edit'
    end
  end

  def destroy
    @context = Context.find(params[:id])
    if @context.user_id == current_user.id
      @context.destroy
      redirect_to contexts_path, notice: 'Context deleted!'
    else
      redirect_to contexts_path,  alert: 'You are not authorized for this action'
    end
  end

  def add_to_favourites
    @favourites = current_user.favourites.new(context_id: params[:id])
    if @favourites.save == true
      redirect_to context_path(params[:id]), notice: 'Added to favourites'
    end
  end


  private
  def context_params
    params.require(:context).permit(:title, :description, :category_id)
  end
end
