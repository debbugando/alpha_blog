class Categoria < ActiveRecord::Base
  has_many :artigo_categorias
  has_many :artigos, through: :artigo_categorias
  validates :nome, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :nome
end