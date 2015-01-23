module Kloudless
  # Account Keys can be used instead of API Keys to restrict access to a
  # specific account’s data. This is most useful for client-side requests.
  #
  # https://developers.kloudless.com/docs#account-keys
  class AccountKey < Model
    # Public: Returns Kloudless::Collection of AccountKey. Raises
    # Kloudless::Error.
    #
    #  :account_ids - Array of account_ids to fetch keys for
    def self.list(account_ids:, **params)
      path = "/accounts/#{account_ids.join(',')}/keys"
      Kloudless::Collection.new(self, http.get(path, params: params))
    end

    def self.retrieve(account_id:, key_id:, **params)
      path = "/accounts/#{account_id}/keys/#{key_id}"
      new(http.get(path, params: params))
    end

    def self.delete(account_id:, key_id:)
      path = "/accounts/#{account_id}/keys/#{key_id}"
      new(http.delete(path))
    end
  end
end
