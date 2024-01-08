# frozen_string_literal: true

RSpec.describe RubyAres::Subject do
  let(:ico) { '26168685' }

  subject { RubyAres::Subject.get(ico) }

  describe 'get' do
    before do
      stub_request(:get, "#{RubyAres::Subject::BASE_URL}/#{ico}")
        .to_return(
          body:
          {
            "ico": "26168685",
            "obchodniJmeno": "Seznam.cz, a.s.",
            "sidlo": {
              "kodStatu": "CZ",
              "nazevStatu": "Česká republika",
              "kodKraje": 19,
              "nazevKraje": "Hlavní město Praha",
              "kodObce": 554782,
              "nazevObce": "Praha",
              "kodSpravnihoObvodu": 51,
              "nazevSpravnihoObvodu": "Praha 5",
              "kodMestskehoObvodu": 51,
              "nazevMestskehoObvodu": "Praha 5",
              "kodMestskeCastiObvodu": 500143,
              "kodUlice": 467359,
              "nazevMestskeCastiObvodu": "Praha 5",
              "nazevUlice": "Radlická",
              "cisloDomovni": 3294,
              "kodCastiObce": 400301,
              "cisloOrientacni": 10,
              "nazevCastiObce": "Smíchov",
              "kodAdresnihoMista": 41064666,
              "psc": 15000,
              "textovaAdresa": "Radlická 3294/10, Smíchov, 15000 Praha 5"
            },
            "pravniForma": "121",
            "financniUrad": "013",
            "datumVzniku": "2000-04-05",
            "datumAktualizace": "2023-11-25",
            "dic": "CZ26168685",
            "icoId": "26168685",
            "adresaDorucovaci": {},
            "seznamRegistraci": {
              "stavZdrojeVr": "AKTIVNI",
              "stavZdrojeRes": "AKTIVNI",
              "stavZdrojeRzp": "AKTIVNI",
              "stavZdrojeNrpzs": "NEEXISTUJICI",
              "stavZdrojeRpsh": "NEEXISTUJICI",
              "stavZdrojeRcns": "NEEXISTUJICI",
              "stavZdrojeSzr": "NEEXISTUJICI",
              "stavZdrojeDph": "AKTIVNI",
              "stavZdrojeSd": "NEEXISTUJICI",
              "stavZdrojeIr": "NEEXISTUJICI",
              "stavZdrojeCeu": "NEEXISTUJICI",
              "stavZdrojeRs": "NEEXISTUJICI",
              "stavZdrojeRed": "NEEXISTUJICI"
            },
            "primarniZdroj": "vr",
            "czNace": [
              "461",
              "46900",
              "581",
              "62090",
              "63120",
              "6820",
              "69200",
              "731",
              "73120",
              "791"
            ],
            "subRegistrSzr": "szr",
            "dicSkDph": "N/A"
          }.to_json
        )
    end

    it 'returns result as OpenStruct' do
      expect(subject).to be_a(OpenStruct)
      expect(subject.ico).to eq(ico)
    end

    context 'Hash structure' do
      subject { RubyAres::Subject.get(ico, Hash) }

      it 'returns result as Hash' do
        expect(subject).to be_a(Hash)
      end
    end
  end
end
