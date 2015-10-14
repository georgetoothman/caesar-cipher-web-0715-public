require 'pry'
class Caesar
  attr_reader :alphabet, :cryptic_phrase, :letter_array, 
              :shift, :cryptic_index_hash, :alpha_index_hash

  def initialize
    @alphabet = %W(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    @cryptic_phrase = "Meet at this time and place"
    @letter_array = Array.new
    @shift = 3
    @cryptic_index_hash = Hash.new
    @alpha_index_hash = Hash.new
  end

  def letterize
    cryptic_phrase.each_char do |cryptic_phrase_letter|
      letter_array << cryptic_phrase_letter
    end
    letter_array
  end

  def caesar_encoder
    alphabet.each_with_index do |letter_in_alphabet, index_of_letter|
      alpha_index_hash[letter_in_alphabet] = index_of_letter
    end
    letter_array.each_with_index do |letter_in_cryptic_phrase_array, indexed_cryptic_letter|
      cryptic_index_hash[indexed_cryptic_letter] = letter_in_cryptic_phrase_array
    end
  end

  def swap_letters
    crypticized_letter_array = Array.new
    cryptic_index_hash.each do |k, v|
      index_to_swap = alpha_index_hash[v.downcase]
      crypticized_letter = index_to_swap + 3
      cryptic_hash = alpha_index_hash.select{|key, val| val == crypticized_letter}
      crypticized_letter_array << cryptic_hash.keys
    end
  end

  def caesar_decode(letter, shift)
  end
end

test = Caesar.new
test.letterize
test.caesar_encoder
test.swap_letters