require_relative 'collection'

module CBR
  module Dynamic
    class Core < CBR::Base
      element :ValCurs, as: :val_curs, class: Collection
    end
  end
end