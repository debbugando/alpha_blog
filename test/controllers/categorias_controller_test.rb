require 'test_helper'

class CategoriasControllerTest < ActionController::TestCase
  #CONFIGURA E CRIA A CATEGORIA
  def setup
    #Cria uma categoria
    @categoria = Categoria.create( nome: "humor")
    #Cria usuário para simular admin
    @user = User.create( username: "Bileh Teste", email: "bileh_teste@email.com", password: "password", admin: true)
  end
  
  #TESTA A ROTA DO INDEX
  test "Rota get Index" do
   get :index
   assert_response :success
  end
  
  #TESTA A ROTA DE CRIAÇÃO
  test "Rota get new" do
    #Essa informação somente no Rails 4, no 5 muda bastante
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  #TESTA A ROTA DE EXIBIÇÃO, PORÉM COMO É NECESSÁRIO ID
  #FOI CRIADO NO SETUP UMA CATEGORIA PARA SER UTILIZADA AQUI
  test "Rota get show" do
    get(:show, { 'id' => @categoria.id } )
    assert_response :success
  end
  
  test "redireciona criacao quando nao for admin" do
    assert_no_difference 'Categoria.count' do
      post :create, categoria: { nome: "Gordice" }
    end
    assert_redirected_to categorias_path
  end
end
