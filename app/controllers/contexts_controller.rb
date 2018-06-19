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
  end

  def edit
    @context = Context.find(params[:id])
  end

  def create
    @context = current_user.contexts.new(context_params)

    if @context.save
      redirect_to @context, notice: 'Context saved!'
    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def update
    @context = Context.find(params[:id])
    if @context.update(context_params)
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


  private
  def context_params
    params.require(:context).permit(:title, :description)
  end
end