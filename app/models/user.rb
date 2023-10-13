class User < ApplicationRecord

    validates :name, presence:true, length: { minimum: 2 };

    validates :email,
    format: { with: /\A(.+)@(.+)\z/, message: "Invalid email", },
            uniqueness: { case_sensitive: false, message: "the email adress already exists" },
            length: { minimum: 4, maximum: 254, message: "The email provided must have more than 4 characters"};

    validates :phone, presence:true, length: { minimum: 9, maximum: 11, message: "Phone is invalid" };

    validates :cpf, length: { is: 11, message: "Invalid CPF"},
    presence: true, uniqueness: true,
    format: { with: /^[0-9]{11}$/, message: 'The CPF number must contain 11 numbers', multiline: true },
    exclusion: { in:%w( 00000000000 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 12345678909 01234567890 ),
    message: "%{value} it is an invalid CPF" };
end
