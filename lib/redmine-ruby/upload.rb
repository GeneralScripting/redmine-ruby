module Redmine
  class Upload < Base
    collection_path "uploads.xml"
    resource_path "attachments/:id.xml"

    def self.create(data)
      uri = URI.parse( her_api.base_uri )
      req = Net::HTTP::Post.new('/uploads.xml', initheader = {'Content-Type' => 'application/octet-stream', 'X-Redmine-API-Key' => @api_token })
      req.body = data
      response = Net::HTTP.new(uri.host, uri.port).start {|http| http.request(req) }
      if response.code.to_i == 201
        parser = Redmine::Middleware::XmlParser.new
        data = parser.parse(response.body)
        data[:data][:upload]["token"]
      else
        raise response.message
      end
    end


  end
end