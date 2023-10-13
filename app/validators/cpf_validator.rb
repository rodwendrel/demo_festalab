class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless cpf_valid?(value)
      record.errors.add attribute, (options[:message] || "is not valid")
    end
  end

  private

  def cpf_valid?(cpf)
    cpf.gsub!(/[^\d]/, '')
    cpf_numbers = cpf.chars.map(&:to_i)
    cpf_digits = cpf_numbers[0..8]
    cpf_verification = cpf_numbers[9..10]

    first_digit = get_digits?(cpf_digits, 10, 0, false)
    second_digit = get_digits?(cpf_digits, 11, first_digit, true)
    is_valid_cpf_number = valid_digits?(cpf_verification, first_digit, second_digit)

    if is_valid_cpf_number
      return true
    else
      return false
    end

  end

  def get_digits? (arr, factor, verifier_digit, is_second_digit)
    sum = 0
    arr.each_with_index { |el, i|
      y = el * (factor - i);
      sum = sum + y;
    }
    additional_number = verifier_digit * 2;
    if is_second_digit
      sum = sum + additional_number;
      result = 11 - (sum % 11);
    else
      result = 11 - (sum % 11);
    end
  end

  def valid_digits?(arr, number1, number2)
    if arr[0] === number1 && arr[1] === number2
      return true
    else
      return false
    end
  end
end
