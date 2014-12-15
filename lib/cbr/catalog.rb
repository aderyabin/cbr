require_relative 'base'
require_relative 'catalog_item'

module CBR
  class Catalog < Base
    elements :Item, as: :items, class: CatalogItem
  end

end