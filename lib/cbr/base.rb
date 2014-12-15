require 'sax-machine'

module CBR
  class Base
    include SAXMachine

    def to_hash
      Hash[instance_variables.map do |name|
        hasherized_value = instance_variable_get(name)
        hasherized_value = hasherized_value.to_hash rescue hasherized_value
        if hasherized_value.is_a?(Array)
          hasherized_value = hasherized_value.map do |v|
            v.to_hash rescue v
          end
        end

        [name[1..-1], hasherized_value]
      end]
    end
  end
end