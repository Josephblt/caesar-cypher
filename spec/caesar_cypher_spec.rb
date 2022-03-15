# frozen_string_literal: true

require 'rspec'
require './src/caesar_cypher'

describe CaesarCypher do
  describe 'cypher' do
    it 'Generic message' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.cypher('Wagner Scholl Lemos', 3)).to eq('Zdjqhu Vfkroo Ohprv')
    end
  end

  describe 'shift' do
    it 'Lowercase char, Right shift_factor' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.shift('a', 5)).to eql('f')
      expect(caesar_cypher.shift('m', 5)).to eql('r')
      expect(caesar_cypher.shift('z', 5)).to eql('e')
      expect(caesar_cypher.shift('m', 27)).to eql('n')
      expect(caesar_cypher.shift('amz', 5)).to eql('f')
    end

    it 'Lowercase char, Left shift_factor' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.shift('a', -5)).to eql('v')
      expect(caesar_cypher.shift('m', -5)).to eql('h')
      expect(caesar_cypher.shift('z', -5)).to eql('u')
      expect(caesar_cypher.shift('m', -27)).to eql('l')
      expect(caesar_cypher.shift('amz', -5)).to eql('v')
    end

    it 'Uppercase char, Right shift_factor' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.shift('A', 5)).to eql('F')
      expect(caesar_cypher.shift('M', 5)).to eql('R')
      expect(caesar_cypher.shift('Z', 5)).to eql('E')
      expect(caesar_cypher.shift('M', 27)).to eql('N')
      expect(caesar_cypher.shift('AMZ', 5)).to eql('F')
    end

    it 'Uppercase char, Left shift_factor' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.shift('A', -5)).to eql('V')
      expect(caesar_cypher.shift('M', -5)).to eql('H')
      expect(caesar_cypher.shift('Z', -5)).to eql('U')
      expect(caesar_cypher.shift('M', -27)).to eql('L')
      expect(caesar_cypher.shift('AMZ', -5)).to eql('V')
    end
  end

  describe 'shift_char' do
    it 'Lowercase char, Right shift, Lowercase limits' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.shift_char('a', 5, LOWERCASE_START, LOWERCASE_END)).to eql('f')
      expect(caesar_cypher.shift_char('m', 5, LOWERCASE_START, LOWERCASE_END)).to eql('r')
      expect(caesar_cypher.shift_char('z', 5, LOWERCASE_START, LOWERCASE_END)).to eql('e')
      expect(caesar_cypher.shift_char('m', 27, LOWERCASE_START, LOWERCASE_END)).to eql('n')
      expect(caesar_cypher.shift_char('amz', 5, LOWERCASE_START, LOWERCASE_END)).to eql('f')
    end
    it 'Lowercase char, Left shift, Lowercase limits' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.shift_char('a', -5, LOWERCASE_START, LOWERCASE_END)).to eql('v')
      expect(caesar_cypher.shift_char('m', -5, LOWERCASE_START, LOWERCASE_END)).to eql('h')
      expect(caesar_cypher.shift_char('z', -5, LOWERCASE_START, LOWERCASE_END)).to eql('u')
      expect(caesar_cypher.shift_char('m', -27, LOWERCASE_START, LOWERCASE_END)).to eql('l')
      expect(caesar_cypher.shift_char('amz', -5, LOWERCASE_START, LOWERCASE_END)).to eql('v')
    end
    it 'Uppercase char, Right shift, Uppercase limits' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.shift_char('A', 5, UPPERCASE_START, UPPERCASE_END)).to eql('F')
      expect(caesar_cypher.shift_char('M', 5, UPPERCASE_START, UPPERCASE_END)).to eql('R')
      expect(caesar_cypher.shift_char('Z', 5, UPPERCASE_START, UPPERCASE_END)).to eql('E')
      expect(caesar_cypher.shift_char('M', 27, UPPERCASE_START, UPPERCASE_END)).to eql('N')
      expect(caesar_cypher.shift_char('AMZ', 5, UPPERCASE_START, UPPERCASE_END)).to eql('F')
    end
    it 'Uppercase char, Left shift, Uppercase limits' do
      caesar_cypher = CaesarCypher.new
      expect(caesar_cypher.shift_char('A', -5, UPPERCASE_START, UPPERCASE_END)).to eql('V')
      expect(caesar_cypher.shift_char('M', -5, UPPERCASE_START, UPPERCASE_END)).to eql('H')
      expect(caesar_cypher.shift_char('Z', -5, UPPERCASE_START, UPPERCASE_END)).to eql('U')
      expect(caesar_cypher.shift_char('M', -27, UPPERCASE_START, UPPERCASE_END)).to eql('L')
      expect(caesar_cypher.shift_char('AMZ', -5, UPPERCASE_START, UPPERCASE_END)).to eql('V')
    end
  end
end

describe String do
  describe 'lowercase?' do
    it 'Generic cases' do
      expect('a'.lowercase?).to eql(true)
      expect('A'.lowercase?).to eql(false)
      expect('8'.lowercase?).to eql(false)
    end
  end

  describe 'uppercase?' do
    it 'Generic cases' do
      expect('A'.uppercase?).to eql(true)
      expect('a'.uppercase?).to eql(false)
      expect('8'.uppercase?).to eql(false)
    end
  end
end
