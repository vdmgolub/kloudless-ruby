require_relative "../test_helper"

class Kloudless::EventTest < Minitest::Test
  def test_list_events
    response = {"objects" => [{"id" => 1, "cursor" => 330}]}
    Kloudless.http.expect(:get, returns: response, args: ["/accounts/1/events", params: {}]) do
      events = Kloudless::Event.list(account_id: 1)
      assert_kind_of Kloudless::Collection, events
      assert_kind_of Kloudless::Event, events.first
    end
  end

  def test_cursor_events
    response = {"cursor" => 330}
    Kloudless.http.expect(:get, returns: response, args: ["/accounts/1/events/latest"]) do
      event = Kloudless::Event.cursor(account_id: 1)
      assert_kind_of Kloudless::Event, event
    end
  end
end
