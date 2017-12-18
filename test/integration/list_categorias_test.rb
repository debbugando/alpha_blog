require 'test_helper'

class ListCategoriasTest < ActionDispatch::IntegrationTest
  def setup
    @categoria = Categoria.create( nome: "Esportes")
    @categoria2 = Categoria.create( nome: "Humor")
  end
  
  test "deve ter listagem de categorias" do
    get categorias_path
    assert_template "categorias/index"
    assert_select "a[href[=?]", categoria_path(@categoria), text: @categoria.nome
    assert_select "a[href[=?]", categoria_path(@categoria2), text: @categoria2.nome
  end
end