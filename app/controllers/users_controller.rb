class UsersController < ApplicationController
  def index
    @title = 'Membres'
    @users = User.all
  end

  def new
    @title = 'Créer un nouveau membre'
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
     @user = User.new(user_params)
     @user.save
     @update = Update.new('title': 'Nouveau membre: ' + @user.name)
     @update.save
     redirect_to @user, notice: 'Nouveau membre: ' + @user.name
  end

  def edit
    @user = User.find(params[:id])
    @title = @user.name
  end

  def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        @update = Update.new('title': 'Membre modifié: ' + @user.name)
        @update.save
        redirect_to users_path, notice: 'Membre modifié: ' + @user.name
      else
        render 'edit'
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :role)
  end
end
