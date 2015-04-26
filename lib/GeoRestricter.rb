   class GeoRestricter
    require 'geoip'
    def self.matches?(request)      
      geo = GeoIP.new('/usr/local/bin/GeoIP.dat')
      geo.country(request.ip).country_name == "United States"
    end
  end