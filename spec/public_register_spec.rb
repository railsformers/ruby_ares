# frozen_string_literal: true

RSpec.describe RubyAres::PublicRegister do
  let(:ico) { '26168685' }

  subject { RubyAres::PublicRegister.get(ico) }

  before do
    stub_request(:get, "#{RubyAres::PublicRegister.base_url}/#{ico}")
      .to_return(
        body:
        {
          "icoId":"26168685",
          "zaznamy":[
            {"rejstrik":"OR","primarniZaznam":true,"spisovaZnacka":[{"datumZapisu":"2000-04-05","soud":"MSPH","oddil":"B","vlozka":6493}]}
          ]
        }.to_json
      )
  end

  describe 'get' do
    it 'returns result as OpenStruct' do
      expect(subject).to be_a(OpenStruct)
      expect(subject.icoId).to eq(ico)
    end

    context 'Hash structure' do
      subject { RubyAres::PublicRegister.get(ico, Hash) }

      it 'returns result as Hash' do
        expect(subject).to be_a(Hash)
      end
    end
  end
  
  describe 'file_mark' do
    it 'returns result as Hash' do
      expect(RubyAres::PublicRegister.file_mark(subject)).to eq({
        court_name: RubyAres::PublicRegister::COURT_CODES['MSPH'],
        first_number: 'B',
        second_number: 6493
      })
    end
  end
end
