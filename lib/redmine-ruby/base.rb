module Redmine
  class Base
    include Her::Model

    include_root_in_json true
    parse_root_in_json true, format: :active_model_serializers

    def self.element_name(name)
      @_her_root_element = name
    end

    def self.api_token(token)
      @api_token = token
    end

    def self.parse(data)
      if data.respond_to?(:keys)
        data.keys.include?(root_element) ? data[root_element] : data
      else
        raise Redmine::Exception, data.kind_of?(Array) ? data.join(', ') : data 
      end
    end

  end
end