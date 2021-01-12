class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    # ルーティングを参照するとわかる。PostCommentモデルのroutesは、post_image_idを参照している。
    comment = PostComment.new(post_comment_params)
    # showで受け取ったパラメータを入れたPostCommentモデルを代入
    comment.user_id = current_user.id
    # PostCommentモデルに、今のログインIDを代入
    comment.post_image_id = post_image.id
    # PostCommentモデルのimage-idに、PostImageモデルのidを代入
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

private

def post_comment_params
  params.require(:post_comment).permit(:comment)
end
end
