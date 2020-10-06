class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @update = Update.new('title': 'Nouveau commentaire par ' + @comment.author)
    @update.save
    redirect_to article_path(@article), notice: 'Commentaire ajouté !'
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :body,)
    end
end
