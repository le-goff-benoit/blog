class HomeController < ApplicationController
  def index
    @last_article = Article.last
    @last_article.text = @last_article.text[0, 100]
    @last_article.text += ' ...'

    @articles = Article.all
  end
end
