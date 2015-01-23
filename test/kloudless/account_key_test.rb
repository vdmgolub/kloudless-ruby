require_relative "../test_helper"
require 'minitest'

class Kloudless::AccountKeyTest < Minitest::Test
  def test_list_account_keys
    Kloudless.http.expect(:get, returns: {"objects" => [{}]}, args: ["/accounts/1,2/keys", params: {}]) do
      account_keys = Kloudless::AccountKey.list(account_ids: [1,2])
      assert_kind_of Kloudless::Collection, account_keys
      assert_kind_of Kloudless::AccountKey, account_keys.first
    end
  end

  def test_retrieve_account_key
    Kloudless.http.expect(:get, args: ["/accounts/1/keys/2", params: {}]) do
      account_key = Kloudless::AccountKey.retrieve(account_id: 1, key_id: 2)
      assert_kind_of Kloudless::AccountKey, account_key
    end
  end

  def test_delete_account_key
    Kloudless.http.expect(:delete, args: ["/accounts/1/keys/2"]) do
      account_key = Kloudless::AccountKey.delete(account_id: 1, key_id: 2)
      assert_kind_of Kloudless::AccountKey, account_key
    end
  end
end
