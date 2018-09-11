class WelcomeController < ApplicationController
  def index
    @contexts = Context.published
  end
end
