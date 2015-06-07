module InfoconnectWrapper
  require 'json'

  class FindCompany
    def url
      "https://api.infoconnect.com/v3/match"
    end

    # example InfoConnectWrapper::FindCompany.find_by_name('Infogroup', 'Papillion, 'NE', 'Enhanced')
    def find_by_name(name, city, state, resource_type)
      begin
        company = Company.new
        r = InfoconnectWrapper.post url,
          {
          :ResourceType => resource_type,
          :CompanyName => name,
          :RequestType => "Company",
          :Limit => "1",
          :City => city,
          :StateProvince => state
        }, :content_type => :json, :accept => :json

        if r["MatchCount"] > 0
          company_to_parse = r["Matches"]["Companies"][0]
          company.init(company_to_parse)
        end
        company
      rescue => e
        puts e
      end
    end
  end
end
