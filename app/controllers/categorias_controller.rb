class CategoriasController < ApplicationController
  before_action :require_admin, except: [:index,:show]
  
  def index
    @categorias = Categoria.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @categoria = Categoria.new
  end
  
  def create
    @categoria = Categoria.new(categoria_params)
    if @categoria.save
      flash[:success] = "Categoria Salva com Sucesso"
      redirect_to categorias_path
    else
      render 'new'
    end
  end
  
  def show
    @categoria = Categoria.find(params[:id])
    @categoria_artigos = @categoria.artigos.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
    @categoria = Categoria.find(params[:id])
  end
  
  def update
    @categoria = Categoria.find(params[:id])
    if @categoria.update(categoria_params)
      flash[:success] = "Categoria Editado com Sucesso"
    redirect_to categoria_path(@categoria)
    else
      render 'edit'
    end
  end
  
  private
  def categoria_params
    params.require(:categoria).permit(:nome)
  end
  
  def require_admin
    if !logged_in? || ( logged_in? && !current_user.admin? )
      flash[:danger] = "Somente Administradores podem realizar essa Ação"
      redirect_to categorias_path
    end
  end
end