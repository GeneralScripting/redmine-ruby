require 'her'

require 'multi_xml'
require 'redmine-ruby/middleware/xml_parser.rb'

require 'redmine-ruby/base.rb'
require 'redmine-ruby/project.rb'
require 'redmine-ruby/issue.rb'

module Redmine
  class Client
    attr_accessor :url, :token, :api

    def initialize(url, token)
      self.url    = url
      self.token  = token
      self.api = Her::API.new
      self.api.setup url: url, ssl: { verify: false } do |c|
        c.use Faraday::Request::BasicAuthentication, token, ''
        c.use Faraday::Request::UrlEncoded
        c.use Redmine::Middleware::XmlParser
        c.use Faraday::Adapter::NetHttp
      end
    end

    def resource(name, options={})
      klass   = "Redmine::#{name.to_s.classify}".constantize
      the_api = api
      Class.new(klass) do |c|
        c.uses_api        the_api
        c.element_name    name.to_s.underscore.to_sym
        c.collection_path klass.collection_path
        c.resource_path   klass.resource_path
      end
    end

    def projects
      resource(:project)
    end

    def issues
      resource(:issue)
    end

  end
end