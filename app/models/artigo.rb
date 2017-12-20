class Artigo < ActiveRecord::Base
  belongs_to :user
  has_many :artigo_categorias
  has_many :categorias, through: :artigo_categorias
  validates :titulo, presence: true, length: { minimum: 3, maximum: 50 }
  validates :descricao, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end