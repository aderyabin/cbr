require_relative "cbr/version"
require 'curl'
require_relative 'cbr/base'
require_relative 'cbr/daily/core'
require_relative 'cbr/dynamic/core'
require_relative 'cbr/catalog'


module CBR
  class << self
    def daily(date = nil)
      date ||= Date.today

      http = Curl.get("http://www.cbr.ru/scripts/XML_daily.asp?date_req=#{format_date(date)}")
      xml_data = http.body_str

      Daily::Core.parse(xml_data).val_curs
    end

    def catalog
      http = Curl.get("http://www.cbr.ru/scripts/XML_val.asp")
      xml_data = http.body_str

      CBR::Catalog.parse(xml_data)
    end

    def dynamic(char_code, from_date, to_date)
      currency_id = daily[char_code].id

      http = Curl.get("www.cbr.ru/scripts/XML_dynamic.asp?date_req1=#{format_date(from_date)}&date_req2=#{format_date(to_date)}&VAL_NM_RQ=#{currency_id.strip}")
      xml_data = http.body_str

      Dynamic::Core.parse(xml_data).val_curs
    end

    private

    def format_date(date)
      "#{date.strftime("%d/%m/%Y")}"
    end
  end
end
