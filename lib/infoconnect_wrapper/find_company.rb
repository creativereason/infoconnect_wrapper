module InfoconnectWrapper
  require 'rest-client'
  require 'json'
  
  class FindCompany
    attr_accessor :api_key
    def init(apikey)
      self.api_key = apikey 
    end

    ##example InfoConnectWrapper::FindCompany.find_by_name('Infogroup', 'Papillion, 'NE', 'Enhanced')
    def find_by_name(name, city, state, resource_type)
      url = "https://api.infoconnect.com/v3/match?apikey=#{self.api_key}"
      company = Company.new
      begin
        response = RestClient.post url,
          {
          :ResourceType => resource_type,
          :CompanyName => name,
          :RequestType => "Company",
          :Limit => "1",
          :City => city,
          :StateProvince => state
        }, :content_type => :json, :accept => :json
        r = JSON.parse response
        if r["MatchCount"] > 0
          company_to_parse = r["Matches"]["Companies"][0]
          company.init(company_to_parse)
        end
      rescue => e
        puts e
      end
      company
    end
  end
end
