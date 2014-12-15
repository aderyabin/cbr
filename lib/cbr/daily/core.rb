require_relative 'collection'

module CBR
  module Daily
    class Core < CBR::Base
      element :ValCurs, as: :val_curs, class: Collection
    end
  end
end