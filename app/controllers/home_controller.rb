class HomeController < ApplicationController
  def index
    @inventions = Invention.order(created_at: :desc)
  end
end
