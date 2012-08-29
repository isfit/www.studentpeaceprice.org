class Sublink < ActiveRecord::Base
  lang_attr :title

  self.primary_key = :id
  belongs_to :tab
  belongs_to :page
end
