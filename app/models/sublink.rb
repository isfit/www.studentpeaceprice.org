class Sublink < ActiveRecord::Base
  belongs_to :tab
  belongs_to :page
end
