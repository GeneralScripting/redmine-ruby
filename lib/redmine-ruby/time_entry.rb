module Redmine
  class TimeEntry < Base
    collection_path "time_entries.xml"
    resource_path "time_entries/:id.xml"
  end
end