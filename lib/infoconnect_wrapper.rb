require 'rest-client'

module InfoconnectWrapper
  class << self
    attr_accessor :api_key
  end

  def self.post(url, params={}, headers={})
    unless api_key ||= @api_key
      raise StandardError.new('No API key provided. ' \
        'Set your API key using "InfoconnectWrapper.api_key = <API-KEY>". ')
    end

    JSON.parse RestClient.post("#{url}?api_key=#{api_key}", params, headers)
  end
end

require 'infoconnect_wrapper/company'
require 'infoconnect_wrapper/find_company'
require 'infoconnect_wrapper/response'

