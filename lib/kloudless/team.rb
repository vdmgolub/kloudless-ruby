module Kloudless
  # https://developers.kloudless.com/docs#team
  class Team < Model
    def self.list(account_id:, **params)
      path = "/accounts/#{account_id}/team"
      Kloudless::Collection.new(self, http.get(path, params: params))
    end
  end
end
