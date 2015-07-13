class LinksController < ApplicationController

  before_action :set_link, only: [:edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
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

end
