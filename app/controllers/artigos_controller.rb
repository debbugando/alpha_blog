class ArtigosController < ApplicationController
    before_action :set_artigo, only: [:edit, :update, :show, :destroy]
    
  def index
    @artigos = Artigo.all
  end
  
  def new
    @artigo = Artigo.new
  end
  
  def create
    #Verificar recebimento dos valores do formulário
    #render plain: params[:artigo].inspect
    #Recebe os valores e valida
    @artigo = Artigo.new(artigo_params)
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
end