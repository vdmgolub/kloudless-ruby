module Kloudless
  # https://developers.kloudless.com/docs#events
  class Event < Model
    # https://developers.kloudless.com/docs#events-list-file/folder-events
    def self.list(account_id:, **params)
      path = "/accounts/#{account_id}/events"
      Kloudless::Collection.new(self, http.get(path, params: params))
    end

    # https://developers.kloudless.com/docs#events-retrieve-latest-cursor
    def self.cursor(account_id:)
      path = "/accounts/#{account_id}/events/latest"
      new(http.get(path))
    end
  end
end
