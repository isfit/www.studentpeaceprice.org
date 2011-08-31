class Page < ActiveRecord::Base
  set_primary_key :id
  belongs_to :sublink
end
