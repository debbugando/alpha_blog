require 'test_helper'

class CategoriasControllerTest < ActionController::TestCase
  #CONFIGURA E CRIA A CATEGORIA
  def setup
    @categoria = Categoria.create( nome: "humor")
  end
  
  #TESTA A ROTA DO INDEX
  test "Rota get Index" do
   get :index
   assert_response :success
  end
  
  #TESTA A ROTA DE CRIAÇÃO
  test "Rota get new" do
    get :new
    assert_response :success
  end
  
  #TESTA A ROTA DE EXIBIÇÃO, PORÉM COMO É NECESSÁRIO ID
  #FOI CRIADO NO SETUP UMA CATEGORIA PARA SER UTILIZADA AQUI
  test "Rota get show" do
    get(:show, { 'id' => @categoria.id } )
    assert_response :success
  end
end
