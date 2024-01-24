module RubyAres
  class PublicRegister < Base
    COURT_CODES = {
      "MSPH" => "Městský soud v Praze",
      "KSPH" => "Krajský soud v Praze",
      "KSCB" => "Krajský soud v Českých Budějovicích",
      "KSTB" => "Krajský soud v Českých Budějovicích – pobočka v Táboře",
      "KSPL" => "Krajský soud v Plzni",
      "KSKV" => "Krajský soud v Plzni – pobočka v Karlových Varech",
      "KSUL" => "Krajský soud v Ústí nad Labem",
      "KSLB" => "Krajský soud v Ústí nad Labem – pobočka v Liberci",
      "KSHK" => "Krajský soud v Hradci Králové",
      "KSPA" => "Krajský soud v Hradci Králové – pobočka v Pardubicích",
      "KSBR" => "Krajský soud v Brně",
      "KSJI" => "Krajský soud v Brně – pobočka v Jihlavě",
      "KSZL" => "Krajský soud v Brně – pobočka ve Zlíně",
      "KSOS" => "Krajský soud v Ostravě",
      "KSOL" => "Krajský soud v Ostravě – pobočka v Olomouci",
      "VSPH" => "Vrchní soud v Praze",
      "VSOL" => "Vrchní soud v Olomouci",
      "NSCR" => "Nejvyšší soud České republiky",
      "MSp" => "Společný soud"
    }.freeze

    class << self
      def base_url
        'https://ares.gov.cz/ekonomicke-subjekty-v-be/rest/ekonomicke-subjekty-vr'.freeze
      end
      
      def file_mark(json)
        record = json.zaznamy.select { |pr| pr.primarniZaznam == true }.first.spisovaZnacka.select { |sz| !sz.datumVymazu }.first
        court_code = record.soud
        court_name = COURT_CODES[court_code] || court_code
        
        {
          court_name: court_name,
          first_number: record.oddil,
          second_number: record.vlozka
        }
      end
    end
  end
end
