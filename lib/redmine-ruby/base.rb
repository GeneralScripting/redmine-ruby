module Redmine
  class Base
    include Her::Model

    parse_root_in_json true

    def self.element_name(name)
      @_her_root_element = name
    end

    def self.parse(data)
      data.keys.include?(root_element) ? data[root_element] : data
    end

  end
end