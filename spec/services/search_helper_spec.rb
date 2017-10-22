require 'rails_helper'

RSpec.describe Services::Eksercise::SearchHelper do
  describe '#parse_query' do

    context 'search for: John 33 9803940' do

      subject { Services::Eksercise::SearchHelper.new 'john 33' }

      it 'parses age and retrieve the right value' do
        parsed_query = subject.parse_query
        expect(parsed_query[:age]).to eq '33'
      end

    end

    context 'search for: 302 Madison Avenue Clair 43' do

      subject { Services::Eksercise::SearchHelper.new '302 Madison Avenue Clair 43' }

      it 'returns only values between 0 and 130' do
        parsed_query = subject.parse_query
        expect(parsed_query[:age]).to eq '43'
      end

    end

  end
end

