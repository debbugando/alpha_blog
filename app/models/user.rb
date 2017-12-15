class User < ActiveRecord::Base
  #Relaciona a classe user com artigos, atribuindo 1..n
  has_many :artigos
  #Antes de salvar coloca a string do e-mail em minusculo
  before_save { self.email = email.downcase }
  #Validação dos dados
  validates :username, presence: true, 
            uniqueness: {case_sensitive: false}, 
            length: { minimum: 3, maximum: 25 }
  #Regex para validar e-mail
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
  #Verifica a segurança da senha enviada
  has_secure_password
end