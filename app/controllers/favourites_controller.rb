class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @context = Context.find(params[:context_id])
    @favourite = current_user.favourites.build(context: @context)
    if @favourite.save
      redirect_to context_path(@context), notice: 'Added to favourites'
    end
  end

  def destroy
    @context = Context.find(params[:context_id])
    @favourite = current_user.favourites.find(params[:id])

    if @favourite.destroy
      flash[:notice] = 'Post unfavourited.'
    else
      flash[:alert] = 'Unfavouriting failed.'
    end
      redirect_to context_path(@context)
  end


end
