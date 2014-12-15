require_relative 'base'

module CBR
  class CatalogItem < Base

    element :Name, as: :name
    element :EngName, as: :eng_name
    element :Nominal, as: :nominal, class: Integer
    element :ParentCode, as: :parent_code

    attribute :ID, as: :id
  end
end