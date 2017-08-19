class HomeController < ApplicationController
  before_action :require_login

  def index
    if params[:search]
      @posts = Post.search(params[:search]).page(params[:page]).order("created_at DESC")
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.page(params[:page]).order("created_at DESC")
      respond_to do |format|
        format.html
        format.js
      end
    end

    @post = Post.new
  end
end
