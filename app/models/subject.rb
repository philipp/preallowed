class Subject < ActiveRecord::Base
  belongs_to              :client
  has_and_belongs_to_many :roles
  has_many                :principals
  has_many                :log_records
end
