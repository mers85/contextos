class Contexts::FavouritesController < ApplicationController
  before_action :load_context, :authenticate_user!

  def update
    @context.favourite!(current_user)
  end

  def destroy
    @context.unfavourite!(current_user)
  end

  private

  def load_context
    @context = Context.find(params[:context_id])
  end

end
