class ArtigoCategoria < ActiveRecord::Base
  belongs_to :artigo
  belongs_to :categoria
end