require_relative "kloudless/collection"
require_relative "kloudless/error"
require_relative "kloudless/http"
require_relative "kloudless/model"
require_relative "kloudless/account"
require_relative "kloudless/account_key"
require_relative "kloudless/team"
require_relative "kloudless/file"
require_relative "kloudless/multipart_upload"
require_relative "kloudless/folder"
require_relative "kloudless/link"
require_relative "kloudless/event"
require_relative "kloudless/version"
require "json"
require "uri"

module Kloudless
  API_VERSION = "v0".freeze
  API_URL = "https://api.kloudless.com/#{API_VERSION}".freeze

  # Public: Authorize with API Key or Account Key. Returns nothing.
  #
  # Options:
  #  :api_key
  #  :account_key
  #
  # https://developers.kloudless.com/docs#authorization
  def self.authorize(options = {})
    Kloudless::HTTP.headers["Authorization"] = if options[:api_key]
      "ApiKey #{options[:api_key]}"
    elsif options[:account_key]
      "AccountKey #{options[:account_key]}"
    else
      raise ArgumentError.new(":api_key or :account_key required")
    end
  end

  # Internal: HTTP client for easier mocking
  def self.http
    @http || Kloudless::HTTP
  end

  def self.http=(client)
    @http = client
  end

  def http
    self.class.http
  end
end
