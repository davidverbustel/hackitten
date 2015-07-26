class LinksController < ApplicationController

  before_action :set_link, only: [:edit, :update, :destroy, :upvote, :downvote]
  before_action :set_user, only: [:create, :upvote, :downvote]
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
    if @link.update(link_params)
      flash[:notice] = "Link was successfully updated."
      redirect_to root_path
    else
      flash[:alert] = "Link must have a title and an URL. The URL must start with http://"
      redirect_to edit_link_path
    end
  end

  def destroy
    @link.destroy
    flash[:notice] = "Link was successfully deleted."
    redirect_to root_path
  end

  def upvote
    @link.liked_by @user
    redirect_to_back_or_default
  end

  def downvote
    @link.downvote_from @user
    redirect_to_back_or_default
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

    # if your user user cannot access a resource in the application because :back
    # depends on the request header variable HTTP_REFERER, this might be
    # the case if the user is for example trying to access the resource with
    # a direct link (e.g. a bookmark or a link from an email). Then use this
    def redirect_to_back_or_default(default = root_url)
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back
      else
        redirect_to default
      end
    end

end
