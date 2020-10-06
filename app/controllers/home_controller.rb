class HomeController < ApplicationController
  def index
    @last_article = Article.last
    @last_article.text = @last_article.text[0, 100]
    @last_article.text += ' ...'

    @articles = Article.all
  end

  def subscribe
    @title = "Formulaire d'inscription"
  end

  def login
    @title = "Espace membre"
  end

  def update
    @title = "Notifications"
    @updates = Update.all
  end
end
