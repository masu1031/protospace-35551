class CommentsController < ApplicationController
  def create
    # binding.pry
    # prototype_id から特定のレコードを取得
    # @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)

    # 特定のプロトタイプに紐づくインスタンスを生成し、属性値を指定
    # @comment = @prototype.comments.new(comment_params)
    # @comment.save
    # @comments = @prototype.comments.includes(:user)
    
    
    # @comment.save
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
      # redirect_to prototype_comments_path(@prototype)
    else
      # binding.pry
      @prototype = @comment.prototype
      @comments = @prototype.comments.includes(:user)
      render template: "prototypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])    
  end

end
