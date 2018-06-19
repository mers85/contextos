class ContextsController < ApplicationController

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
    @context = Context.new(context_params)

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
    @context.destroy

    redirect_to contexts_path
  end


  private
  def context_params
    params.require(:context).permit(:title, :description)
  end
end
