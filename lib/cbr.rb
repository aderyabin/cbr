require_relative "cbr/version"
require 'net/http'
require 'uri'
require_relative 'cbr/base'
require_relative 'cbr/daily/core'
require_relative 'cbr/dynamic/core'
require_relative 'cbr/catalog'


module CBR
  class << self
    def daily(date = nil)
      date ||= Date.today

      xml_data = Net::HTTP.get(URI("http://www.cbr.ru/scripts/XML_daily.asp?date_req=#{format_date(date)}"))

      Daily::Core.parse(xml_data).val_curs
    end

    def catalog
      xml_data = Net::HTTP.get(URI("http://www.cbr.ru/scripts/XML_val.asp"))

      CBR::Catalog.parse(xml_data)
    end

    def dynamic(char_code, from_date, to_date)
      currency_id = daily[char_code].id

      xml_data = Net::HTTP.get(URI("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=#{format_date(from_date)}&date_req2=#{format_date(to_date)}&VAL_NM_RQ=#{currency_id.strip}"))

      Dynamic::Core.parse(xml_data).val_curs
    end

    private

    def format_date(date)
      "#{date.strftime("%d/%m/%Y")}"
    end
  end
end
