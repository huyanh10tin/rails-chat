class HomeController < ApplicationController
  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all
    end
  end
end
