require_relative "../test_helper"

class Kloudless::TeamTest < Minitest::Test
  def test_list_teams
    Kloudless.http.expect(:get, returns: {"objects" => [{}]}, args: ["/accounts/1/team", params: {}]) do
      teams = Kloudless::Team.list(account_id: 1)
      assert_kind_of Kloudless::Collection, teams
      assert_kind_of Kloudless::Team, teams.first
    end
  end
end
