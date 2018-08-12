class Contexts::RedactionController < ApplicationController
  before_action :set_context, only: [:edit]
  before_action :authenticate_context_owner!, only: [:edit]

  def index
    @contexts = current_user.contexts
  end

  def edit
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
