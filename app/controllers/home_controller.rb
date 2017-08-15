class HomeController < ApplicationController
  before_action :require_login

  def index
    if params[:search]
      posts = Post.paginate(page: params[:page], per_page: 3)
      @posts = posts.search(params[:search]).('created_at DESC')
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
