module CBR
  module Dynamic
    class Item < CBR::Base
      def date
        Date.parse(@date)
      end

      def value
        @value.sub(',', '.').to_f
      end

      element :Nominal, as: :nominal, class: Integer
      element :Value, as: :value

      attribute :Date, as: :date
    end
  end
end