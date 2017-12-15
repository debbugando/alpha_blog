class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome To The Danger Zone #{@user.username}"
      redirect_to artigos_path
    else
      render 'new'
    end
  end
  
  private
  #Dados permitidos no parâmetro do objeto user
  def user_params
    params.require(:user).permit(:username, :email, :password)  
  end
end
