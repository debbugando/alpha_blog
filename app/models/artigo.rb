class Artigo < ActiveRecord::Base
  belongs_to :user
  validates :titulo, presence: true, length: { minimum: 3, maximum: 50 }
  validates :descricao, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end