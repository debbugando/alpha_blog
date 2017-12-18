class Categoria < ActiveRecord::Base
  validates :nome, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :nome
end