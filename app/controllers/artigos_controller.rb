class ArtigosController < ApplicationController
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
      flash[:notice] = "Artigo Salvo com Sucesso!"
      #Redireciona
      redirect_to artigo_path(@artigo)
    else
      render "new"
    end
  end
  
  def edit
    @artigo = Artigo.find(params[:id])
  end
  
  def update
    @artigo = Artigo.find(params[:id])
    if @artigo.update(artigo_params)
      flash[:notice] = "Artigo Editado com Sucesso!"
      redirect_to artigo_path(@artigo)
    else
      render 'edit'
    end
  end
  
  def show
    @artigo = Artigo.find(params[:id])
  end
  
  def destroy
    @artigo = Artigo.find(params[:id])
    @artigo.destroy
    flash[:notice] = "Artigo Removido com Sucesso!"
    redirect_to artigos_path()
  end
  
  private
  def artigo_params
    params.require(:artigo).permit(:titulo, :descricao)
  end
end