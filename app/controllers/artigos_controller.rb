class ArtigosController < ApplicationController
  def index
  end
  
  def new
    @artigo = Artigo.new()
  end
  
  def create
    #Verificar recebimento dos valores do formulário
    #render plain: params[:artigo].inspect
    #Recebe os valores e valida
    @artigo = Artigo.new(artigo_params)
    #Salva os dados
    #Abordagem simples
    #@artigo.save
    #Redireciona
    #redirect_to artigos_show(@artigo)
    
    #Segunda Abordagem
    if @artigo.save
      #Mensagem de Sucesso
      flash[:notice] = "Artigo Salvo com Sucesso!"
      #Redireciona
      redirect_to artigo_path(@artigo)
    else
      render "new"
    end
  end
  
  def show
    @artigo = Artigo.find(params[:id])
  end
  
  private
  def artigo_params
    params.require(:artigo).permit(:titulo, :descricao)
  end
end