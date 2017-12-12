class AddDescricaoToArtigos < ActiveRecord::Migration
  def change
    add_column :artigos, :descricao, :text
    add_column :artigos, :created_at, :datetime
    add_column :artigos, :updated_at, :datetime
  end
end
