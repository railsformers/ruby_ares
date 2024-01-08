# frozen_string_literal: true

require_relative "ruby_ares/version"
require_relative "ruby_ares/subject"

module RubyAres
  class Error < StandardError
    attr_reader :status, :type, :response

    def initialize(msg:, type:, status:, response:)
      @status = status
      @type = type
      @response = response
      super(msg)
    end
  end
end
