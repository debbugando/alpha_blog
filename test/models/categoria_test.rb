require 'test_helper'

class CategoriaTest < ActiveSupport::TestCase
  def setup
    @categoria = Categoria.new( nome: "sports" )
  end
  
  test "Categoria deve ser válida" do
    assert @categoria.valid?
  end
  
  test "Nome deverá estar configurado" do
    @categoria.nome = " "
    assert_not @categoria.valid?
  end
  
  test "Nome deverá ser unico" do
    @categoria.save
    categoria2 = Categoria.new( nome: "sports")
    assert_not categoria2.valid?
  end
  
  test "Nome não deverá ser muito longo" do
    @categoria.nome = "a" * 26
    assert_not @categoria.valid?
  end
  
  test "Nome não deverá ser curto" do
    @categoria.nome = "aa"
    assert_not @categoria.valid?
  end
end