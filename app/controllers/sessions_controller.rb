class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by( email: params[:session][:email].downcase )
    #Armazena o id do usuário na sessão
    session[:user_id] = user.id
    if user && user.authenticate( params[:session][:password])
      flash[:success] = "Logado com Sucesso."
      redirect_to users_path
    else
      flash.now[:danger] = "Dados Incorretos"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Deslogado com Sucesso."
    redirect_to root_path
  end
end