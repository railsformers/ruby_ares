require 'ostruct'

module RubyAres
  class Base
    class << self
      def get(ico, object_class = OpenStruct)
        uri = URI("#{base_url}/#{ico}")

        response = Net::HTTP.get_response(uri)

        case response
        when Net::HTTPSuccess then
          JSON.parse(response.body, object_class: object_class)
        when Net::HTTPRedirection then
          location = response['location']
          warn "redirected to #{location}"
          fetch(location, limit - 1)
        else
          raise RubyAres::Error.new(
            msg: "Request failed with #{response.code}",
            type: response.class.name,
            status: response.code,
            response: (JSON.parse(response.body) rescue response.body)
          )
        end
      end
    end
  end
end
