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