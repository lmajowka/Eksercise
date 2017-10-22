require 'rails_helper'

RSpec.describe Services::Eksercise::EkserciseApi do
  describe '#parse_query' do

    it 'parses age' do
      query = 'john 33'
      parsed_query = subject.class.parse_query query
      expect(parsed_query[:age]).to eq '33'
    end

  end
end

