# infoconnect_wrapper
A Ruby wrapper around Infoconnect's API

## Just getting started
The idea is to make this a full wrapper. My initial needs are for company so I've
built that first.

Create a `config/initializers/infoconnect_wrapper.rb` file and set your
API key there:

```ruby
InfoconnectWrapper.api_key = "YOUR_API_KEY"
```

## Example - Calling by a company name with city and state
Here's a [Company](http://developer.infoconnect.com/company-object)

    find = InfoconnectWrapper::FindCompany.new
    company = find.find_by_name('Infogroup', 'Papillion', 'NE', 'Enhanced')
    #company is a InfoConnectWrapper::Company
    puts company.CorporateSalesVolumeRange
    => $10-20 Million
    puts company.CompanyName
    => "InfoGroup, Inc."

## Todo's
- Wrap this all in the currently empty response object so we can put a wrapper around people
- Add some tests
- Find a way to handle InfoGroup's UpperCase responses without effecting those fields like
`ACLAttendanceRange` that would couldn't handle a `camelize` and `constantize` transition
