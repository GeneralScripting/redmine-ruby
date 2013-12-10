require 'her'

require 'multi_xml'
require 'redmine-ruby/middleware/xml_parser.rb'

require 'redmine-ruby/exception.rb'
require 'redmine-ruby/base.rb'
require 'redmine-ruby/project.rb'
require 'redmine-ruby/issue.rb'
require 'redmine-ruby/upload.rb'
require 'redmine-ruby/time_entry.rb'
require 'redmine-ruby/version.rb'
require 'redmine-ruby/custom_field.rb'
require 'redmine-ruby/issue_status.rb'
require 'redmine-ruby/enumeration.rb'
require 'redmine-ruby/issue_category.rb'

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
      the_token = token
      Class.new(klass) do |c|
        c.uses_api        the_api
        c.api_token       the_token
        c.element_name    name.to_s.underscore.to_sym
        c.collection_path klass.collection_path
        c.resource_path   klass.resource_path
      end
    end

    def projects
      resource(:project)
    end

    def enumerations
      resource(:enumeration)
    end

    def issue_statuses
      resource(:issue_status)
    end

    def issue_categories
      resource(:issue_category)
    end

    def trackers
      resource(:trackers)
    end

    def custom_fields
      resource(:custom_fields)
    end

    def issues
      resource(:issue)
    end

    def uploads
      resource(:upload)
    end

    def time_entries
      resource(:time_entry)
    end

  end
end
