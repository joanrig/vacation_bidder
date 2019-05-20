class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  config.time_zone = 'Eastern Time (US & Canada)'
  config.active_record.default_timezone = :local
end
