class HomeController < ApplicationController
  before_action :require_login
  
  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all
    end
  end
end
