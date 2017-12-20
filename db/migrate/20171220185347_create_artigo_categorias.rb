class CreateArtigoCategorias < ActiveRecord::Migration
  def change
    create_table :artigo_categorias do |t|
      t.integer :artigo_id
      t.integer :categoria_id
    end
  end
end
