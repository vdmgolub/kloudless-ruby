require_relative "test_helper"

class KloudlessTest < Minitest::Test
  def test_unauthorized
    assert_raises Kloudless::ForbiddenError do
      Kloudless::Account.list
    end
  end

  def test_authorize_api_key
    Kloudless.authorize(api_key: "API_KEY")
    Kloudless.http.mock_response(Struct.new(:body).new('{}')) do
      Kloudless::Account.list
      assert_equal "ApiKey API_KEY", Kloudless::HTTP.last_request["Authorization"]
    end
  end

  def test_authorize_account_key
    Kloudless.authorize(account_key: "ACCOUNT_KEY")
    Kloudless.http.mock_response(Struct.new(:body).new('{}')) do
      Kloudless::Account.list
      assert_equal "AccountKey ACCOUNT_KEY", Kloudless::HTTP.last_request["Authorization"]
    end
  end
end
