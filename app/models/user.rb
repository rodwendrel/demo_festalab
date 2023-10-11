class User < ApplicationRecord

   def self.ransackable_attributes(auth_object = nil)
      ["name"]
    end

  #Validação do Active Record
  validates :email,
  #Utiliza o padrão REGEX para validação dos caracteres do email e apresenta mensagem para o usuário
  format: { with: /\A(.+)@(.+)\z/, message: "Email inválido", },
            #Verifica duplicidades de email na base de dados
            uniqueness: { case_sensitive: false, message: "O email informado já está cadastrado" },
            #Valida quatidade de caracteres no email
            length: { minimum: 4, maximum: 254, message: "O email informado deve ter mais de 4 Caracteres"};


  validates :cpf,
     presence: true,
     format: { with: /^[0-9]{11}$/, message: 'O cpf informado é', multiline: true }


  validates :phone,
     presence: true,
     numericality: true,
     length: { minium: 9, maximum: 11, message: "Informe um número de telefone válido" }


end
