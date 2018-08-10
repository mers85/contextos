class Contexts::RedactionController < ApplicationController
  before_action :set_context
  before_action :authenticate_context_owner!

  def edit
  end

  def update
  end

  private
  def set_context
    @context = Context.find(params[:context_id])
  end
  def authenticate_context_owner!
    if @context.user_id != current_user.id
      redirect_to "/", notice: 'You are not authorized to do this action'
    end
  end
end
