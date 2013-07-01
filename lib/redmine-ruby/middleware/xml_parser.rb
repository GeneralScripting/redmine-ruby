module Redmine
  module Middleware
    class XmlParser < Faraday::Response::Middleware
      def parse(body)
        json = ::MultiXml.parse(body).symbolize_keys
        json = json.values.first if json.values.first.is_a?(Array)
        {
          :data => json,
          :errors => {},
          :metadata => {}
        }
      end
      
      def on_complete(env)
        env[:body] = case env[:status]
        when 204
          parse('<xml />')
        else
          parse(env[:body])
        end
      end
    end
  end
end