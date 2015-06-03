module InfoconnectWrapper
  class Company
    attr_accessor :ACLAttendance, :ACLAttendanceRange, :ACLCallStatus, :ACLChurchSize, :ACLChurchSizeRange, :ACLDenomination, :ACLGroup, :ACLSchoolSize, :ACLSchoolSizeRange, :Address, :AddressParsed, :AddressTypeIndicator, :Assets, :BankAsset, :BigBusinessSegmentation, :Booknumber, :BuildingNumber, :BusinessStatus, :BusinessStatusCodeYear1, :BusinessStatusCodeYear2, :BusinessType, :CallStatus, :CarrierRoute, :CensusBlock, :CensusTract, :City, :CompanyDescription, :CompanyGrowth, :CompanyName, :CompDate, :Contacts, :CorporateEmployeesSizeActual, :CorporateEmployeesSizeActualLastYear, :CorporateEmployeesSizeActualTwoYearsAgo, :CorporateEmployeesSizeRange, :CorporateOutputVolumeLastYear, :CorporateSalesVolumeActual, :CorporateSalesVolumeRange, :County, :CountyCode, :CreditCardsAccepted, :CreditLimit, :CreditRatingScore, :CreditRatingScoreNumeric, :Csa, :DeliveryPointBarcode, :EIN1, :EIN2, :EIN3, :Fax, :FirstName, :FortuneRanking, :Franchise, :Gender, :GovernmentOffices, :GrowthRate, :GrowthTrend, :HasACLMultipleCongregations, :HasForeignParent, :HoldingStatus, :HoursOfOperation, :Id, :ImportExport, :InWealthyArea, :IsACLMembershipSource, :IsACLNewConstructionPlanned, :IsActiveWebAddress, :IsHomeBusiness, :IsFranchise, :IsGovernmentAgency, :LastName, :Links, :Location, :LocationEmployeesSizeActual, :LocationEmployeesSizeRange, :LocationSalesVolumeActual, :LocationSalesVolumeRange, :LongCompanyName, :MetaTagWebSite, :Msa, :MultiTenantNumber, :MultiTenantRange, :NaicsList, :NumberOfPCs, :OfficeSize, :ParentCompany, :Phone, :PrimaryNaics, :PrimaryNaics2, :PrimaryNaics4, :PrimarySic, :PrimarySicAdSize, :PrimarySicDescription, :PrimarySicDesignator, :PrimarySicYearAppeared, :Population, :PostalCode, :RecordStatus, :ProductsSold, :SicList, :SiteNumber, :StateProvince, :StockExchange, :SquareFootage, :Subsidiary, :TeleResearchUpdateDate, :TickerSymbol, :Title, :TollFree, :UpdateDate, :UriList, :WebAddress, :WhiteCollar, :YearEstablished, :YellowPageAction1, :YellowPageAction2, :YellowPageCode, :ZipPlus4
    #this takes the a ["Matches"]["Company"] from the API, basically it's a wrapper around the infoconnect company object
    #I know this list of attributes is ugly, but I really don't want to write those by hand, we'll use instance_methods
    #to parse through them matching

    def init(matched)
      Company.attributes.each do |attr|
        self.send("#{attr}=", matched[attr])      
      end
    end

    def self.attributes
      attrs = []
      self.instance_methods(false).each do |var|
        name = var.to_s
        if name.include? "="
          name.gsub!(":", "")
          name.gsub!("=", "")
          attrs.push name
        end
      end
      attrs    
    end

  end
end
