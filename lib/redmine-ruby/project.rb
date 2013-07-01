module Redmine
  class Project < Base
    collection_path "projects.xml"
    resource_path "projects/:id.xml"
  end
end