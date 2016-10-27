$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'infoconnect_wrapper'
  s.version     = '0.0.0'
  s.date        = '2015-06-02'
  s.summary     = %q{Ruby wrapper around InfoConnect API}
  s.description = "A Ruby wrapper for Infoconnect API. Currently supporting http://developer.infoconnect.com/company-object"
  s.authors     = ["Brian Schwartz"]
  s.email       = 'bschwartz@creativereason.com'
  s.files       = ["lib/infoconnect_wrapper.rb", "lib/infoconnect_wrapper/", "lib/infoconnect_wrapper/response.rb", "lib/infoconnect_wrapper/company.rb", "lib/infoconnect_wrapper/find_company.rb"]
  s.homepage    =
    'https://github.com/creativereason/infoconnect_wrapper'
  s.license       = 'MIT'
end
