require 'rails_helper'

RSpec.describe Services::Eksercise::SearchHelper do

  describe '#parse_query' do

    before do
      @parsed_query = subject.parse_query
    end

    context 'search for: Prof. Elisabeth Änglund 33 9803940' do

      subject { Services::Eksercise::SearchHelper.new 'Prof. Elisabeth Änglund 33 9803940' }

      it 'parses age and retrieve the right age' do
        expect(@parsed_query[:age]).to eq '33'
      end

      it 'returns only values greater then 130 for phone' do
        expect(@parsed_query[:phone]).to eq '9803940'
      end

      it 'parses names correctly' do
        expect(@parsed_query[:name]).to eq 'Prof. Elisabeth Änglund'
      end

    end

    context 'search for: 302 Madison Avenue Clair 43' do

      subject { Services::Eksercise::SearchHelper.new '302 Madison Avenue Clair 43' }

      it 'returns only values between 0 and 130 for age' do
        expect(@parsed_query[:age]).to eq '43'
      end

      it 'parses part of the phone from the string' do
        expect(@parsed_query[:phone]).to eq '302'
      end


    end

  end

end

