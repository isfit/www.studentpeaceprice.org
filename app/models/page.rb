class Page < ActiveRecord::Base
  self.primary_key = :id
  belongs_to :sublink
end
