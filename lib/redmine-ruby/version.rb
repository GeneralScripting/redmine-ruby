module Redmine
  VERSION = "0.2.7"

  class Version < Base
    collection_path "projects/:project_id/versions.xml"
    resource_path "versions/:id.xml"
  end
  
end
