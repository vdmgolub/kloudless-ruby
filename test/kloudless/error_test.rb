require_relative "../test_helper"

class Kloudless::ErrorTest < Minitest::Test
  Response = Struct.new(:code, :body)

  def test_from_json
    json = {
      "error_code" => "naming_conflict",
      "message" => "boom town",
      "id" => "request-id",
      "status_code" => "409",
      "conflicting_resource_id" => "conflicting-resource-id"
    }

    error = Kloudless::Error.from_json(json)
    assert_kind_of Kloudless::NamingConflictError, error
    assert_equal "409", error.status_code
    assert_equal "naming_conflict", error.error_code
    assert_equal "request-id", error.id
    assert_equal "conflicting-resource-id", error.conflicting_resource_id
    assert_equal "boom town", error.message
  end
end
