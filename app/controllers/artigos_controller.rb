class ArtigosController < ApplicationController
    before_action :set_artigo, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    #Usuário somente efetua ação no(s) artigo(s) que o próprio criou
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
  def index
    @artigos = Artigo.paginate( page: params[:page], per_page: 2)
  end
  
  def new
    @artigo = Artigo.new
  end
  
  def create
    #Verificar recebimento dos valores do formulário
    #render plain: params[:artigo].inspect
    #Recebe os valores e valida
    @artigo = Artigo.new(artigo_params)
    @artigo.user_id = session[:user_id]
    #Salva os dados
    if @artigo.save
      #Mensagem de Sucesso
      flash[:success] = "Artigo Salvo com Sucesso!"
      #Redireciona
      redirect_to artigo_path(@artigo)
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @artigo.update(artigo_params)
      flash[:success] = "Artigo Editado com Sucesso!"
      redirect_to artigo_path(@artigo)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @artigo.destroy
    flash[:danger] = "Artigo Removido com Sucesso!"
    redirect_to artigos_path()
  end
  
  private
  def set_artigo
    @artigo = Artigo.find(params[:id])
  end
  def artigo_params
    params.require(:artigo).permit(:titulo, :descricao)
  end
  
  def require_same_user
    if current_user != @artigo.user && !current_user.admin?
      flash[:danger] = "Ação Negada, Usuário sem Permissão."
      redirect_to root_path
    end
  end
end