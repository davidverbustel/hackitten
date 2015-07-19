class LinksController < ApplicationController

  before_action :set_link, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:create]
  before_action :authenticate_user!, except: [:index]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = @user.links.build(link_params)
    @link.save
    redirect_to root_path
  end

  def edit
  end

  def update
    @link.update(link_params)
    redirect_to root_path
  end

  def destroy
    @link.destroy
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def set_user
    @user = current_user
  end

end
