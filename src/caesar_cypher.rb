# frozen_string_literal: true

LOWERCASE_START = 97
LOWERCASE_END = 122
UPPERCASE_START = 65
UPPERCASE_END = 90

# Helper methods for String class.
class String
  def lowercase?
    ord >= LOWERCASE_START and ord <= LOWERCASE_END
  end

  def uppercase?
    ord >= UPPERCASE_START and ord <= UPPERCASE_END
  end
end

# Implementation of the famous Caesar cypher.
class CaesarCypher
  def cypher(message, shift_factor)
    cyphered_array = message.chars.map { |char| shift(char, shift_factor) }
    cyphered_array.join
  end

  def shift(char, shift_factor)
    if char.lowercase?
      shift_char char, shift_factor, LOWERCASE_START, LOWERCASE_END
    elsif char.uppercase?
      shift_char char, shift_factor, UPPERCASE_START, UPPERCASE_END
    else
      char
    end
  end

  def shift_char(char, shift_factor, shift_start, shift_end)
    safe_shift_factor = shift_factor % (shift_end - shift_start + 1)
    shift_ord = char.ord + safe_shift_factor
    shift_ord = shift_ord - 1 - shift_end + shift_start if shift_ord > shift_end
    shift_ord.chr
  end
end

puts 'Enter the message:'
message = gets
puts 'Enter the shift factor (e.g: -3, 5):'
shift_factor = gets.chomp.to_i
puts CaesarCypher.new.cypher message, shift_factor
