class HomeController < ApplicationController
  def index
    @contents = Content.order(created_at: :desc)
  end
end
