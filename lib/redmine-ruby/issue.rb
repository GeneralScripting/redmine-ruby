module Redmine
  class Issue < Base
    collection_path "projects/:project_id/issues.xml"
    resource_path "projects/:project_id/issues/:id.xml"
  end
end