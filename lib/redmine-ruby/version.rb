module Redmine

  class Version < Base
    collection_path "projects/:project_id/versions.xml"
    resource_path "versions/:id.xml"
  end

end
