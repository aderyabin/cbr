require_relative 'item'

module CBR
  module Daily
    class Collection < CBR::Base

      def date
        Date.parse(@date)
      end

      attribute :Date, as: :date
      elements :Valute, as: :valutes, class: Item

      def [](code)
        valutes.select{|v| v.char_code == code.to_s.to_s.upcase }.first
      end
    end
  end
end