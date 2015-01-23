module Kloudless
  # https://developers.kloudless.com/docs#links
  class Link < Model
    def self.list(account_ids:, **params)
      path = "/accounts/#{account_ids.join(',')}/links"
      Kloudless::Collection.new(self, http.get(path, params: params))
    end

    # https://developers.kloudless.com/docs#links-create-a-link
    def self.create(account_id:, file_id:, **params)
      params[:file_id] = file_id
      path = "/accounts/#{account_id}/links"
      new(http.post(path, params: params))
    end

    # https://developers.kloudless.com/docs#links-retrieve-a-link
    def self.retrieve(account_id:, link_id:, **params)
      path = "/accounts/#{account_id}/links/#{link_id}"
      new(http.get(path, params: params))
    end

    # https://developers.kloudless.com/docs#links-update-a-link
    def self.update(account_id:, link_id:, **params)
      path = "/accounts/#{account_id}/links/#{link_id}"
      new(http.patch(path, params: params))
    end

    # https://developers.kloudless.com/docs#links-delete-a-link
    def self.delete(account_id:, link_id:)
      path = "/accounts/#{account_id}/links/#{link_id}"
      new(http.delete(path))
    end
  end
end
