module Redmine
  class IssueCategory < Base
    collection_path "projects/:project_id/issue_categories.xml"
    resource_path "issue_categories/:id.xml"
  end
end