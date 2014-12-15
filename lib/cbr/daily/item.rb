module CBR
  module Daily
    class Item < CBR::Base
      def value
        @value.sub(',', '.').to_f
      end

      def char_code
        @char_code.to_s.strip
      end


      element :NumCode, as: :num_code
      element :CharCode, as: :char_code
      element :Nominal, as: :nominal, class: Integer
      element :Value, as: :value
      element :Name, as: :name

      attribute :ID, as: :id
    end
  end
end