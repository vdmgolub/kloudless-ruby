module Kloudless
  # https://developers.kloudless.com/docs#multipart-upload
  class MultipartUpload < Model
    def self.init(account_id:, **params)
      path = "/accounts/#{account_id}/multipart"
      new(http.post(path, params: params))
    end

    def self.retrieve(account_id:, multipart_id:)
      path = "/accounts/#{account_id}/multipart/#{multipart_id}"
      new(http.get(path))
    end

    # https://developers.kloudless.com/docs#multipart-upload-upload-part
    def self.upload(account_id:, multipart_id:, part_number:, **params)
      path = "/accounts/#{account_id}/multipart/#{multipart_id}"
      params[:part_number] = part_number
      new(http.put(path, params: params))
    end

    # https://developers.kloudless.com/docs#multipart-upload-finalize-multipart-session
    def self.finalize(account_id:, multipart_id:)
      path = "/accounts/#{account_id}/multipart/#{multipart_id}/complete"
      new(http.post(path))
    end

    # https://developers.kloudless.com/docs#multipart-upload-abort-multipart-session
    def self.abort(account_id:, multipart_id:)
      path = "/accounts/#{account_id}/multipart/#{multipart_id}"
      new(http.delete(path))
    end

    class << self
      alias_method :delete, :abort
    end
  end
end
