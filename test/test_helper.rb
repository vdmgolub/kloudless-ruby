require_relative "../lib/kloudless"
require "minitest/autorun"
require "minitest/mock"
require "byebug"

module Kloudless
  class Test
    def teardown
      unmock
    end

    def unmock
      Kloudless.http = Kloudless::HTTP
      Kloudless.http.mock_response = nil
    end
  end
end
