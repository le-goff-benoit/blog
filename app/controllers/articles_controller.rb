class ArticlesController < ApplicationController
  def index
    @search_term = params[:query]
    if !@search_term
      @title = 'Actualités'
      @articles = Article.all
    else
      @title = 'Recherche avec le terme: ' + @search_term
      @articles = Article.where('title LIKE ?', "%#{@search_term}%").or(Article.where('text LIKE ?', "%#{@search_term}%"))

    end
  end

  def new
    @title = 'Créer un nouvel article de blog'
  end

  def show
    @article = Article.find(params[:id])
    @title = @article.title
  end

  def results
    @search_term = params[:query]
    @title = @search_term
  end

  def create
     @article = Article.new(article_params)
     @article.save
     @update = Update.new('title': 'Nouvel article: ' + @article.title)
     @update.save
     redirect_to articles_path, notice: 'Nouvel article: ' + @article.title
  end

  def edit
    @article = Article.find(params[:id])
    @title = @article.title
  end

  def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        @update = Update.new('title': 'Article modifié: ' + @article.title)
        @update.save
        redirect_to articles_path, notice: 'Article modifié: ' + @article.title
      else
        render 'edit'
      end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
