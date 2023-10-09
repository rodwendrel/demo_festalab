class User < ApplicationRecord

  #Validação do Active Record
  # validates :email,
  # #Utiliza o padrão REGEX para validação dos caracteres do email e apresenta mensagem para o usuário
  # format: { with: /\A(.+)@(.+)\z/, message: "Email inválido", },
  #           #Verifica duplicidades de email na base de dados
  #           uniqueness: { case_sensitive: false, message: "O email informado já está cadastrado" },
  #           #Valida quatidade de caracteres no email
  #           length: { minimum: 4, maximum: 254, message: "O email informado deve ter mais de 4 Caracteres"};


  # validates :cpf,
  #   cpf: { message: 'skfgnfkpnbgidfgkbokidfoghbndjfkohgb' }
  #   #format: { with: /^[0-9]{11}$/, message: 'Bimboca', multiline: true }
  #
  validates :cpf, cpf: { message: 'Sua mensagem de validação' }



end
