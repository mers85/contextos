class RedactionController < ApplicationController
  before_action :authenticate_context_owner!

  def edit
  end

  def update
  end

  private
  def authenticate_context_owner!
    @context = Context.find(params[:id])
    if @context.user_id != current_user.id
      redirect_to "/", notice: 'You are not authorized to do this action'
    end
  end
end
