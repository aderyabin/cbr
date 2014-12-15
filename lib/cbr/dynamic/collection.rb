require_relative 'item'

module CBR
  module Dynamic
    class Collection < CBR::Base
      elements :Record, as: :records, class: Item

      def [](date)
        valutes.select{|v| v.date == date }.first
      end
    end
  end
end