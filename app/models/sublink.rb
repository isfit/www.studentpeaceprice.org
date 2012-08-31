class Sublink < ActiveRecord::Base
  self.primary_key = :id
  belongs_to :tab
  belongs_to :page
end
