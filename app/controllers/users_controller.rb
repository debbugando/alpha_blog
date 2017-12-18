class UsersController < ApplicationController
  #Rotas que  não necessitam de sessão, exceto edição, atualização e exibição
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy] 
  before_action :require_admin, only: [:destroy]
  
  def index
  @users = User.paginate( page: params[:page], per_page: 2)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome To The Danger Zone #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Usuário Editado com Sucesso"
      redirect_to artigos_path
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @user_articles = @user.artigos.paginate( page: params[:page], per_page: 2)
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "Usuário e postagens Removidos com Sucesso."
      redirect_to users_path
    end
  end
  
  private
  #Dados permitidos no parâmetro do objeto user
  def user_params
    params.require(:user).permit(:username, :email, :password)  
  end
  
  #Define usuário
  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "Usuário sem Permissão para Editar Perfil."
      redirect_to root_path
    end
  end
  
  def require_admin
    if logged_in? && !current_user.admin?
      flash[:danger] = "Somente Administradores podem efetuar essa ação."
      redirect_to users_path
    end
  end
end
