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
      if @link.save
        flash[:notice] = "Link was successfully created."
        redirect_to root_path
      else
        flash[:alert] = "Link must have a title and an URL. The URL must start with http://"
        redirect_to new_link_path
      end
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
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    def set_user
      @user = current_user
    end

end
