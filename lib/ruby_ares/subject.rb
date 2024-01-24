module RubyAres
  class Subject < Base
    class << self
      def base_url
        'https://ares.gov.cz/ekonomicke-subjekty-v-be/rest/ekonomicke-subjekty'.freeze
      end
    end
  end
end
