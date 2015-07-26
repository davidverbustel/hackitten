class CommentsController < ApplicationController

  before_action :set_comment, only: [:destroy]

  def create
    @link = Link.find(params[:link_id])
    # assign the comment to the link (1 link has many comments)
    # I cannot use .create instead of .build because .create = .new + .save and
    # and therefore saves before I assign @comment.user = current_user
    # I must save at the very end
    # Note. Apparently .build is just an alias for .new
    @comment = @link.comments.build(comment_params)
    # assign the comment to the user (1 comment has 1 user)
    @comment.user = current_user
    @comment.save
    flash[:notice] = "Comment was successfully created."
    redirect_to link_path(@link)
   end

  def destroy
    @comment.destroy
    redirect_to_back_or_default
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:link_id, :body, :user_id)
    end

    #Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
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
