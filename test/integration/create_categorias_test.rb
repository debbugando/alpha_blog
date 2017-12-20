require 'test_helper'

class CreateCategoriasTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "BilehTeste", email: "bileh_teste@email.com", password: "password", admin: true)
  end
  
  #Teste para inserção de Dados Válidos
  test "get formulário nova categoria e cria categoria" do
    #Simulando login
    sign_in_as(@user, "password")
    #Começa o teste indo para a rota de criação da Categoria
    get new_categoria_path
    #Exibe o template
    assert_template 'categorias/new'
    #Verifica se exite categoria
    assert_difference 'Categoria.count', 1 do
      #Insere nova categoria
      post_via_redirect categorias_path, categoria: { nome: "sports"}
    end
    
    #Retorna para o index da Categoria
    assert_template "categorias/index"
    #Verifica se o valor inserido acima retorna na view
    assert_match "sports", response.body
  end
  
  #Teste para inserção de Dados Inválidos
  test "envio de categoria invalida resulta em falha" do
    #Simulando login
    sign_in_as(@user, "password")
    
    #Começa o teste indo para a rota de criação da Categoria
    get new_categoria_path
    #Exibe o template
    assert_template 'categorias/new'
    #Não verifica se exite categoria
    assert_no_difference 'Categoria.count' do
      #Insere nova categoria em branco
      post categorias_path, categoria: { nome: " "}
    end
    
    #Retorna para o template de criação da Categoria
    assert_template "categorias/new"
    #Verifica se os elementos abaixo estão na view
    assert_select "h2.panel-title" 
    assert_select "div.panel-body"
  end
end